//
//  MainViewController.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataCollectionViewController.h"

@interface MainViewController : CoreDataCollectionViewController

- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)resultsController layout:(UICollectionViewLayout *)layout andRepoName:(NSString *)repoName;

@end
