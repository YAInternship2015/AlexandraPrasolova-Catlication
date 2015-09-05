//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATTableViewCell.h"

@interface CATTableViewCell ()

@property (nonatomic, strong) IBOutlet UILabel *catNameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *catImageName;

@end

@implementation CATTableViewCell

- (void)setUpWithModel:(CATOneCatData *)catData {
    self.catNameLabel.text = catData.catName;
    self.catImageName.image = [UIImage imageNamed:catData.catImageName];
}

@end
