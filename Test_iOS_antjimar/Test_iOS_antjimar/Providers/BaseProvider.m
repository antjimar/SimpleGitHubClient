//
//  BaseProvider.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "BaseProvider.h"
#import "RequestManagerFactory.h"
#import "CoreDataStack.h"

@interface BaseProvider ()
@property (nonatomic, strong) CoreDataStack *coreDataStack;
@end

@implementation BaseProvider

#pragma mark - Getters Methods
- (id<RequestManagerProtocol>)requestManager {
    if (!_requestManager) {
        _requestManager = [RequestManagerFactory httpRequestManager];
    }
    return _requestManager;
}

- (NSManagedObjectContext *)managedObjectContext {
    if (!_managedObjectContext) {
        _managedObjectContext = [self.coreDataStack managedObjectContext];
    }
    return _managedObjectContext;
}

- (NSManagedObjectContext *)writeManagedObjectContext {
    if (!_writeManagedObjectContext) {
        _writeManagedObjectContext = [self.coreDataStack writeManagedObjectContext];
    }
    return _writeManagedObjectContext;
}

#pragma mark - Private Getters Methods
- (CoreDataStack *)coreDataStack {
    if (!_coreDataStack) {
        _coreDataStack = [CoreDataStack sharedInstance];
    }
    return _coreDataStack;
}

@end
