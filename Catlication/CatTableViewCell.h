//
//  CatTableViewCell.h
//  Catlication
//
//  Created by Alexandra Prasolova on 8/8/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *catName;
@property (nonatomic, strong) IBOutlet UIImageView *catPic;

@end
