//
//  ReposProvider.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "ReposProvider.h"
#import "RepoEntity.h"
#import "NSManagedObject+Addons.h"
#import "NSManagedObject+ActiveRecord.h"

@implementation ReposProvider

- (void)reposByUser:(NSString *)user withCompletion:(void(^)(NSArray *repos, NSError *error))completion {
    NSString *path = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", user];
    NSDictionary *param = @{};
    
    [self.requestManager GET:path parameters:param completion:^(id responseObject) {
        __weak typeof(self) weakSelf = self;
        [self.writeManagedObjectContext performBlock:^{
            __strong typeof(weakSelf) self = weakSelf;
            NSError *errorJSON;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&errorJSON];
            if (errorJSON) {
                if (completion) {
                    completion(nil, errorJSON);
                }
            }
            
            // Delete old data
            [RepoEntity ar_deleteAllEntitiesInContext:self.writeManagedObjectContext];
            
            // Persist new data
            NSMutableArray *reposCache = [NSMutableArray array];
            for (NSDictionary *repoDict in responseDictionary) {
                RepoEntity *repoEntity = [RepoEntity parseRepoByDictionary:repoDict inManagedObjectContext:self.writeManagedObjectContext];
                [reposCache addObject:repoEntity];
            }
            NSError *coreDataError;
            [self.writeManagedObjectContext save:&coreDataError];
            if (coreDataError) {
                NSLog(@"%@", coreDataError);
            }
            if (completion) {
                NSMutableArray *mainThreadRepos = [NSMutableArray array];
                for (RepoEntity *mainThreadRepoEntity in reposCache) {
                    [mainThreadRepos addObject:[mainThreadRepoEntity objectInManagedObjectContext:self.managedObjectContext]];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion([mainThreadRepos copy], nil);
                });
            }
        }];
        
    } error:^(id responseObject, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
    
}

@end
