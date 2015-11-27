//
//  CoreDataCollectionViewController.h
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <UIKit/UIKit.h>

@import CoreData;

@interface CoreDataCollectionViewController : UICollectionViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

+ (instancetype)coreDataCollectionViewControllerWithFetchedResultsController:(NSFetchedResultsController *)resultsController layout:(UICollectionViewLayout *)layout;

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)resultsController layout:(UICollectionViewLayout *)layout;

@end
