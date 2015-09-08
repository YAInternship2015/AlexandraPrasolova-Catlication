//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATOneCatData+Dictionary.h"

@protocol CATCatsDataManagment <NSObject>

- (void) catsDataWasChanged;

@end

@interface CATDataSource : NSObject

- (instancetype)initWithDelegate:(UIViewController <CATCatsDataManagment>*)delegate; //DESIGNATED
- (CATOneCatData *)catAtIndex:(NSUInteger)i;
- (NSUInteger)numberOfCats;
- (BOOL)reloadCatsData;     //load cats data from source file once again

@end

