//
//  NSManagedObject+Addons.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "NSManagedObject+Addons.h"

@implementation NSManagedObject (Addons)

- (instancetype)objectInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    if (managedObjectContext == self.managedObjectContext) {
        return self;
    }
    __block NSManagedObject *object;
    NSManagedObjectID *objectId = [self.objectID copy];
    [managedObjectContext performBlockAndWait:^{
        object = [managedObjectContext objectWithID:objectId];
    }];
    return object;
}

@end
