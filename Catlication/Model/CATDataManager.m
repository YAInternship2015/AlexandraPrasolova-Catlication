//
//  CATDataManager.m
//  Catlication
//
//  Created by Alexandra Prasolova on 9/3/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATDataManager.h"
#import "CATDataSource.h"
#import "NSBundle+PathToCats.h"

@implementation CATDataManager //this class purpose is to manage all CATDataSourse instances.

+ (instancetype)dataManager {
    return [[CATDataManager alloc]init];
}

- (BOOL)addCat:(CATOneCatData *)newCat {
    NSString *pathToCatsSourceFile = [NSBundle pathToCatsFile];
    NSMutableArray *catsData = [NSMutableArray arrayWithContentsOfFile:pathToCatsSourceFile];
    
    [catsData addObject:[newCat dictionaryRepresentation]];
    [catsData writeToFile:pathToCatsSourceFile atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:CATDataSourceDataWasChangedNotificationName object:nil];
    return YES;
}

- (BOOL)deleteCat:(CATOneCatData *)catToDelete {
    NSString *pathToCatsSourceFile = [NSBundle pathToCatsFile];
    NSMutableArray *catsData = [NSMutableArray arrayWithContentsOfFile:pathToCatsSourceFile];
        [catsData removeObject:[catToDelete dictionaryRepresentation]];
        [catsData writeToFile:pathToCatsSourceFile atomically:YES];
    
    return YES;
}

- (void)deleteCatsAtIndexes:(NSArray *)catsToDelete {    
    for (CATOneCatData *cat in catsToDelete) {
        [self deleteCat:cat];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:CATDataSourceDataWasChangedNotificationName object:nil];
}

@end
