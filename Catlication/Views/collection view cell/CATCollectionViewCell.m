//
//  CollectionViewCell.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/22/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATCollectionViewCell.h"

@interface CATCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *catImageView;

@end

@implementation CATCollectionViewCell

- (void)setUpWithModel:(CATOneCatData *)catData {
    self.catImageView.image = [UIImage imageNamed:catData.catImageName];
}

@end
