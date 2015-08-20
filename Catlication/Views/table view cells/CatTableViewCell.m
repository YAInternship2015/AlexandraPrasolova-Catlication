//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATTableViewCell.h"

@interface CATTableViewCell ()

@property (nonatomic, strong) IBOutlet UILabel *catName;
@property (nonatomic, strong) IBOutlet UIImageView *catPic;

@end

@implementation CATTableViewCell

- (void)setUpWithModel:(CATOneCatData *)catData {
#warning эта проверка не нужна, self здесь будет всегда. Даже если вдруг какой-то объект nil, посылая ему сообщение приложение не упадет. nil может отвечать на любой селектор, и возвращать из селектора будет тоже nil
    if (self) {
        self.catName.text = catData.catName;
        self.catPic.image = [UIImage imageNamed:catData.catPic];
    }
}

@end
