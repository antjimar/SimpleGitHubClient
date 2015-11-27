//
//  ReposProvider.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "ReposProvider.h"

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
            
            
            // Persist new data
            
            
        }];
        
    } error:^(id responseObject, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
    
}

@end
