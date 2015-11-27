//
//  BaseProvider.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "RequestManagerProtocol.h"

@interface BaseProvider : NSObject

@property (nonatomic, strong) id<RequestManagerProtocol> requestManager;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectContext *writeManagedObjectContext;

@end
