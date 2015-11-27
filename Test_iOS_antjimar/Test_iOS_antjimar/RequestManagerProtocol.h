//
//  RequestManagerProtocol.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestManagerProtocol <NSObject>

- (void)GET:(NSString *)strinURL
 parameters:(NSDictionary *)parameters
 completion:(void(^)(id responseObject))successBlock
      error:(void(^)(id responseObject, NSError *error))errorBlock;

@end
