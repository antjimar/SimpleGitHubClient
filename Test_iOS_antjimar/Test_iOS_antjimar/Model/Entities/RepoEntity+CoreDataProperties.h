//
//  RepoEntity+CoreDataProperties.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RepoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface RepoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *repoEntityId;
@property (nullable, nonatomic, retain) NSString *repoEntityName;
@property (nullable, nonatomic, retain) NSString *repoEntityDescription;
@property (nullable, nonatomic, retain) NSString *repoEntityOwnerLogin;
@property (nullable, nonatomic, retain) NSNumber *repoEntityFork;

@end

NS_ASSUME_NONNULL_END
