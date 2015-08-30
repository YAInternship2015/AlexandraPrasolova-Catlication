//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CATOneCatData : NSObject 

@property (nonatomic, strong, readonly) NSString *catName;
@property (nonatomic, strong, readonly) NSString *catPic;

+ (instancetype)catWithName:(NSString *)catName andAvatar:(NSString *)catPic;
- (instancetype)initWithDictionary:(NSDictionary *)dict;//DESIGNATED
- (NSDictionary *)dictionryFromOneCatData;

@end
