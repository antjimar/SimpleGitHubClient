//
//  RepoEntity.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "RepoEntity.h"

@implementation RepoEntity

+ (instancetype)parseRepoByDictionary:(NSDictionary *)dictionary inManagedObjectContext:(NSManagedObjectContext *)context {
    RepoEntity *repoEntity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
    repoEntity.repoEntityId = [NSString stringWithFormat:@"%@", objectFromDictionaryValue(dictionary[@"id"])];
    repoEntity.repoEntityName = objectFromDictionaryValue(dictionary[@"name"]);
    repoEntity.repoEntityDescription = objectFromDictionaryValue(dictionary[@"description"]);
    repoEntity.repoEntityOwnerLogin = objectFromDictionaryValue(dictionary[@"owner"][@"login"]);
    if (objectFromDictionaryValue(dictionary[@"fork"])) {
        repoEntity.repoEntityFork = objectFromDictionaryValue(dictionary[@"fork"]);
    }
    return repoEntity;
}

#pragma mark - Utils Methods
static inline id objectFromDictionaryValue(id value) {
    id returnValue;
    if ([value isEqual:[NSNull null]] || value == nil) {
        returnValue = nil;
    } else {
        returnValue = value;
    }
    return returnValue;
}

@end
