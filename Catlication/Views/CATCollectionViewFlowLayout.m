//
//  layout.m
//  Catlication
//
//  Created by Alexandra Prasolova on 9/4/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATCollectionViewFlowLayout.h"

@implementation CATCollectionViewFlowLayout

static const NSInteger columnsNum = 3; //number of cats in one row

- (CGSize)itemSize {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGSize catCellSize;
    UIEdgeInsets sectionInset = self.sectionInset;
    CGFloat minInteritenSpacing = self.minimumInteritemSpacing;
    catCellSize.width = ((screenWidth-sectionInset.left - sectionInset.right + minInteritenSpacing) / columnsNum) - minInteritenSpacing;
    catCellSize.height = catCellSize.width;
    return catCellSize;
}
@end
