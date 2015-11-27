//
//  RequestManagerFactory.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "RequestManagerFactory.h"
#import "HTTPRequestManager.h"

@implementation RequestManagerFactory

+ (id<RequestManagerProtocol>)httpRequestManager {
    return [[HTTPRequestManager alloc] init];
}

@end
