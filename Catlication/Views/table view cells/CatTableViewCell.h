//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CATOneCatData.h"

@interface CATTableViewCell : UITableViewCell

#warning немного не то форматирование: - (void)setUpWithModel:(CATOneCatData *)catData;
- (void) setUpWithModel:(CATOneCatData *)catData;

@end
