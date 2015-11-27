//
//  LoadReposInteractor.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "LoadReposInteractor.h"
#import "ReposProvider.h"

@implementation LoadReposInteractor

- (void)loadReposByUser:(NSString *)user withCompletion:(void(^)(NSArray *array, NSError *error))completion {
    [self.reposProvider reposByUser:user withCompletion:^(NSArray *repos, NSError *error) {
        if (error) {
            if (completion) {
                completion(nil, error);
            }
        } else {
            if (completion) {
                completion(repos, nil);
            }
        }
    }];
}

#pragma mark - Getters Methods
- (ReposProvider *)reposProvider {
    if (!_reposProvider) {
        _reposProvider = [[ReposProvider alloc] init];
    }
    return _reposProvider;
}

@end
