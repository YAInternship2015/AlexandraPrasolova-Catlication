//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CATOneCatData.h"

@protocol CATCatsDataManagment <NSObject>

- (void) catsDataWasChanged;

@end

@interface CATDataSource : NSObject

- (instancetype)initFromFile:(NSString *)fileName
                      ofType:(NSString *)fileType
                withDelegate:(UIViewController <CATCatsDataManagment>*)delegate; //DESIGNATED
- (CATOneCatData *)catAtIndex:(NSUInteger)i;
- (NSUInteger)numberOfCats;
- (void)saveCat:(CATOneCatData *)newCat;                //add new cat to source file
- (void)deleteCatsAtIndexes:(NSArray *)catsToDelete;    //remove cats from source file
- (BOOL)reloadCatsData;                                 //load cats data from source file once again

@end

