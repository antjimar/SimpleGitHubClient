//
//  AppDelegate.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "CoreDataStack.h"

static CGFloat const kMarginCells = 0.0f;

@interface AppDelegate ()

@property (strong, nonatomic) CoreDataStack *coreDataStack;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UICollectionViewFlowLayout *layout = [self setupLayout];
    NSFetchedResultsController *results = [self setupNSFetchResultsController];
    
    MainViewController *mainViewController = [[MainViewController alloc] initWithFetchedResultsController:results layout:layout andRepoName:@"XING"];
    UINavigationController *navigatinoVC = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    [self.window setRootViewController:navigatinoVC];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (UICollectionViewFlowLayout *)setupLayout {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = kMarginCells;
    layout.itemSize = CGSizeMake(screenWidth, screenWidth);
    
    return layout;
}

- (NSFetchedResultsController *)setupNSFetchResultsController {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"RepoEntity"];
    request.sortDescriptors = @[];
    NSFetchedResultsController *results = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                              managedObjectContext:self.coreDataStack.managedObjectContext
                                                                                sectionNameKeyPath:nil
                                                                                         cacheName:nil];
    return results;
}

- (CoreDataStack *)coreDataStack {
    if (!_coreDataStack) {
        _coreDataStack = [CoreDataStack sharedInstance];
    }
    return _coreDataStack;
}

@end
