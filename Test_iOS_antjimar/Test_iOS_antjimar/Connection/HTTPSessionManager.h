//
//  HTTPSessionManager.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPSessionManager : NSURLSession

+ (instancetype)sharedInstance;

@end
