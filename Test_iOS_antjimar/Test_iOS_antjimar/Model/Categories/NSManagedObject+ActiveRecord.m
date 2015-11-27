//
//  NSManagedObject+ActiveRecord.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "NSManagedObject+ActiveRecord.h"

@implementation NSManagedObject (ActiveRecord)

+ (id)ar_createEntityInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
}

+ (BOOL)ar_deleteAllEntitiesInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([self class])];
    NSError *fetchError;
    NSArray *fetchResult = [context executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"%@", fetchError);
        return NO;
    }
    for (NSManagedObject *object in fetchResult) {
        [context deleteObject:object];
    }
    return YES;
}


@end
