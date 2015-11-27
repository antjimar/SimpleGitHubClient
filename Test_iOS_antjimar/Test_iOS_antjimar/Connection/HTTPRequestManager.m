//
//  HTTPRequestManager.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//
#import "HTTPRequestManager.h"
#import "HTTPSessionManager.h"

@implementation HTTPRequestManager

- (void)GET:(NSString *)strinURL
 parameters:(NSDictionary *)parameters
 completion:(void(^)(id responseObject))successBlock
      error:(void(^)(id responseObject, NSError *error))errorBlock {
    
    NSURL *url = [NSURL URLWithString:strinURL];
    url = [self NSURL:url byAppendingQueryParameters:parameters];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *task = [self.httpSessionManager dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
        if (!error) {
            if (HTTPResponse.statusCode == 200) {
                if (successBlock) {
                    successBlock(data);
                }
            } else {
                if (errorBlock) {
                    NSError *errorStatusCode = [NSError errorWithDomain:@"test_antjimar" code:HTTPResponse.statusCode userInfo:nil];
                    errorBlock(data, errorStatusCode);
                }
            }
        } else {
            if (error) {
                errorBlock(nil, error);
            }
        }
    }];
    [task resume];
}

#pragma mark - Getters Methods
- (HTTPSessionManager *)httpSessionManager {
    if (!_httpSessionManager) {
        _httpSessionManager = [HTTPSessionManager sharedInstance];
    }
    return _httpSessionManager;
}


#pragma mark - Private Methods
- (NSURL *)NSURL:(NSURL *)URL byAppendingQueryParameters:(NSDictionary *)parameters {
    NSString* URLString = [NSString stringWithFormat:@"%@?%@", [URL absoluteString], [self stringFromQueryParameters:parameters]];
    return [NSURL URLWithString:URLString];
}

- (NSString *)stringFromQueryParameters:(NSDictionary *)queryParameters {
    NSMutableArray* parts = [NSMutableArray array];
    [queryParameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        NSString *part = [NSString stringWithFormat: @"%@=%@",
                          [key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]],
                          [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]
                          ];
        [parts addObject:part];
    }];
    return [parts componentsJoinedByString: @"&"];
}

@end
