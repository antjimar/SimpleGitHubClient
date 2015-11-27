//
//  LoadReposInteractor.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReposProvider;

@interface LoadReposInteractor : NSObject

@property (strong, nonatomic) ReposProvider *reposProvider;

- (void)loadReposByUser:(NSString *)user withCompletion:(void(^)(NSArray *array, NSError *error))completion;

@end
