//
//  CollectionViewCell.h
//  Catlication
//
//  Created by Alexandra Prasolova on 8/22/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CATOneCatData.h"

@interface CATCollectionViewCell : UICollectionViewCell

- (void)setUpWithModel:(CATOneCatData *)catData;

@end