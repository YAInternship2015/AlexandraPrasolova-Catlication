//
//  CollectionViewCell.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/22/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATCollectionViewCell.h"

@interface CATCollectionViewCell ()

@property (nonatomic, strong) IBOutlet UIImageView *catPic;

@end

@implementation CATCollectionViewCell

- (void)setUpWithModel:(CATOneCatData *)catData {
    self.catPic.image = [UIImage imageNamed:catData.catPic];
}

@end
