//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATTableViewCell.h"

@interface CATTableViewCell ()
#warning лучше catNameLabel
@property (nonatomic, strong) IBOutlet UILabel *catName;
#warning лучше catImageView
@property (nonatomic, strong) IBOutlet UIImageView *catPic;

@end

@implementation CATTableViewCell

- (void)setUpWithModel:(CATOneCatData *)catData {
#warning лишний сдвиг вправо
        self.catName.text = catData.catName;
        self.catPic.image = [UIImage imageNamed:catData.catPic];
}

@end
