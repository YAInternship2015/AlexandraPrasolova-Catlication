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

static CATDataManager *dataMAnager = nil;

@implementation CATDataManager //this class purpose is to manage all CATDataSourse instances. It's supposed to be a singleton - ONE INSTANCE TO RULE THEM ALL 

#warning ONE INSTANCE TO RULE THEM ALL - Noooooooo! Синглтонов здесь не должно быть. Вообще постарайтесь их использовать только в крайних случаях, когда без синглтона не обойтись

+ (instancetype)dataManager {
    if (!dataMAnager) {
        dataMAnager = [[CATDataManager alloc]init];
    }
    return dataMAnager;
}

- (BOOL)addCat:(CATOneCatData *)newCat {
    NSString *pathToCatsSourceFile = [NSBundle pathToCatsFile];
    NSMutableArray *catsData = [NSMutableArray arrayWithContentsOfFile:pathToCatsSourceFile];
    
    [catsData addObject:[newCat dictionryRepresentation]];
    [catsData writeToFile:pathToCatsSourceFile atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:CATDataSourceDataWasChangedNotificationName object:nil];
    return YES;
}

- (BOOL)deleteCat:(CATOneCatData *)catToDelete {
    NSString *pathToCatsSourceFile = [NSBundle pathToCatsFile];
    NSMutableArray *catsData = [NSMutableArray arrayWithContentsOfFile:pathToCatsSourceFile];
        [catsData removeObject:[catToDelete dictionryRepresentation]];
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
