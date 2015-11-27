//
//  CoreDataStack.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const managedObjectContextDidMergeChangesNotification;

typedef void(^CoreDataManagerCompletionBlock)(BOOL finished);

@interface CoreDataStack : NSObject

@property (nonatomic, readonly, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, readonly, strong) NSManagedObjectContext *writeManagedObjectContext;

+ (instancetype)sharedInstance;
- (void)cleanAllLocalStorage;
- (void)deleteAllObjectsForEntity:(NSEntityDescription *)entityDescription completion:(CoreDataManagerCompletionBlock)completion;
- (void)deleteAllObjectsForEntity:(NSEntityDescription *)entityDescription;

@end
