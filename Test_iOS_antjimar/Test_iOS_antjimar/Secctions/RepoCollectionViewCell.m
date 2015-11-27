//
//  RepoCollectionViewCell.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import "RepoCollectionViewCell.h"

@implementation RepoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _repoNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.bounds.size.width, 20.0f)];
        [_repoNameLabel setFont:[UIFont systemFontOfSize:15.0f weight:UIFontWeightMedium]];
        [_repoNameLabel setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:_repoNameLabel];
        
        _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, _repoNameLabel.bounds.size.height + 40.0, self.bounds.size.width, 50.0f)];
        [_descriptionLabel setFont:[UIFont systemFontOfSize:15.0f weight:UIFontWeightMedium]];
        [_descriptionLabel setTextAlignment:NSTextAlignmentCenter];
        [_descriptionLabel setNumberOfLines:0];
        [self.contentView addSubview:_descriptionLabel];
        
        _loginOfTheOwnerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, _descriptionLabel.bounds.size.height + _repoNameLabel.bounds.size.height + 70.0, self.bounds.size.width, 20.0f)];
        [_loginOfTheOwnerLabel setFont:[UIFont systemFontOfSize:15.0 weight:UIFontWeightMedium]];
        [_loginOfTheOwnerLabel setTextAlignment:NSTextAlignmentCenter];
        [_loginOfTheOwnerLabel setNumberOfLines:0];
        [self.contentView addSubview:_loginOfTheOwnerLabel];
        
        UIView *horizontalLine = [[UIView alloc]initWithFrame:CGRectMake(0.0f, self.bounds.size.width - 1.0 ,self.bounds.size.width, 1)];
        horizontalLine.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:horizontalLine];
    }
    
    return self;
}

@end
