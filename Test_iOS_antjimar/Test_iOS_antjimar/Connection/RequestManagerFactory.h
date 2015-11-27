//
//  RequestManagerFactory.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestManagerProtocol.h"

@interface RequestManagerFactory : NSObject

+ (id<RequestManagerProtocol>)httpRequestManager;

@end
