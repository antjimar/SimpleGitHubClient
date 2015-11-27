//
//  ReposProvider.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "BaseProvider.h"

@interface ReposProvider : BaseProvider

- (void)reposByUser:(NSString *)user withCompletion:(void(^)(NSArray *repos, NSError *error))completion;

@end
