//
//  CATFactory.m
//  Catlication
//
//  Created by Alexandra Prasolova on 9/4/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATFactory.h"
#import "CATOneCatData.h"

@implementation CATFactory

+ (CATOneCatData *)catWithName:(NSString *)catName avatar:(NSString *)catImageName {
    NSDictionary *newCat = @{ @"catName" : catName, @"catImgName" : catImageName };
    return [[CATOneCatData alloc]initWithDictionary:newCat];
}

@end
