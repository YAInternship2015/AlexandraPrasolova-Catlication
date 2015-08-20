//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CATOneCatData.h"

@interface CATDataSource : NSObject

- (instancetype)initFromFile:(NSString *)fileName ofType:(NSString *)fileType; //DESIGNATED
- (CATOneCatData *)catAtIndex:(NSUInteger)i;
- (NSUInteger)numberOfCats;

@end

