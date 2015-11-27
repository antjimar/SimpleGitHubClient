//
//  MainViewController.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "MainViewController.h"
#import "LoadReposInteractor.h"
#import "RepoCollectionViewCell.h"
#import "RepoEntity.h"

@interface MainViewController ()

@property (nonatomic, copy) NSString *repoName;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) LoadReposInteractor *loadReposInteractor;

@end

@implementation MainViewController

- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)resultsController layout:(UICollectionViewLayout *)layout andRepoName:(NSString *)repoName {
    if (self = [super initWithFetchedResultsController:resultsController layout:layout]) {
        self.title = [NSString stringWithFormat:@"%@ repos", repoName];
        _repoName = repoName;
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activityIndicator setHidden:YES];
        [_activityIndicator stopAnimating];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureCollectionView];
    [self setupAcitivityIndicator];
    [self loadData];
}

#pragma mark - Configure Methods
- (void)configureCollectionView {
    self.collectionView.backgroundColor = [UIColor colorWithRed:222.0f/255.0f green:222.0f/255.0f blue:222.0f/255.0f alpha:0.8];
    [self.collectionView registerClass:[RepoCollectionViewCell class] forCellWithReuseIdentifier:@"repoCollectionCell"];
}

- (void)loadData {
    [self.loadReposInteractor loadReposByUser:self.repoName withCompletion:^(NSArray *array, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.activityIndicator.isAnimating) {
                [self stopActivityIndicator];
            }
            if (error) {
                UIAlertController *alertError = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Error from server" preferredStyle:UIAlertControllerStyleAlert];
                [alertError addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                }]];
                [self presentViewController:alertError animated:YES completion:nil];
            }
        });
    }];
}

#pragma mark - Data Source Methods
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    [self stopActivityIndicator];
    
    RepoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"repoCollectionCell" forIndexPath:indexPath];
    RepoEntity *repoEntity = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.repoNameLabel.text = [NSString stringWithFormat:@"Name: %@", repoEntity.repoEntityName];
    cell.descriptionLabel.text = [NSString stringWithFormat:@"Description: %@", repoEntity.repoEntityDescription];
    cell.loginOfTheOwnerLabel.text = [NSString stringWithFormat:@"Login: %@", repoEntity.repoEntityOwnerLogin];
    
    if (repoEntity.repoEntityFork == nil || repoEntity.repoEntityFork == 0) {
        cell.contentView.backgroundColor = [UIColor greenColor];
    }

//    id<PictureEntityProtocol> item = [self.fetchedResultsController objectAtIndexPath:indexPath];
//    UICollectionViewCell<PictureEntityCellProtocol> *cell = [PictureEntityFactory cellForEntity:item
//                                                                              forCollectionView:collectionView
//                                                                                    atIndexPath:indexPath];
//    [cell drawPictureEntity:item];
    
    return cell;
}

#pragma mark - Activity Indicator Methods
- (void)initActivityIndicator {
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
}

- (void)stopActivityIndicator {
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden:YES];
}

- (void)setupAcitivityIndicator {
    // Center and start animating
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.center = CGPointMake(self.view.bounds.size.width / 2.0f, self.view.bounds.size.width / 2.0f);
    [self initActivityIndicator];
}

#pragma mark - Getters Methods
- (LoadReposInteractor *)loadReposInteractor {
    if (!_loadReposInteractor) {
        _loadReposInteractor = [[LoadReposInteractor alloc] init];
    }
    return _loadReposInteractor;
}

@end
