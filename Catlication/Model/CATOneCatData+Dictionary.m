//
//  CATOneCatData+Dictionary.m
//  Catlication
//
//  Created by Alexandra Prasolova on 9/2/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATOneCatData+Dictionary.h"

@implementation CATOneCatData (Dictionary)

- (NSDictionary *)dictionaryRepresentation {
    NSDictionary *catDict = @{ @"catName" : self.catName, @"catImgName" : self.catImageName };
    return catDict;
}

@end
