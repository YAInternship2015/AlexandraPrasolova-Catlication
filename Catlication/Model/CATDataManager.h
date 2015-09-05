//
//  CATDataManager.h
//  Catlication
//
//  Created by Alexandra Prasolova on 9/3/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CATOneCatData;

@interface CATDataManager : NSObject

+ (instancetype)dataManager;
- (BOOL)addCat:(CATOneCatData *)newCat;
- (void)deleteCatsAtIndexes:(NSArray *)catsToDelete;

@end
