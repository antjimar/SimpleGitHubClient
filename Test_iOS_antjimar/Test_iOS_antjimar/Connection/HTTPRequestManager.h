//
//  HTTPRequestManager.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestManagerProtocol.h"

@class HTTPSessionManager;

@interface HTTPRequestManager : NSObject<RequestManagerProtocol>

@property (strong, nonatomic) HTTPSessionManager *httpSessionManager;

@end
