//
//  NSManagedObject+ActiveRecord.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (ActiveRecord)

+ (id)ar_createEntityInContext:(NSManagedObjectContext *)context;
+ (BOOL)ar_deleteAllEntitiesInContext:(NSManagedObjectContext *)context;

@end
