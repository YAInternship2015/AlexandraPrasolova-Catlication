//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATDataSource.h"
#import "CATOneCatData.h"

@interface CATDataSource ()

@property (nonatomic,strong) NSMutableArray *catsArray; //data model - array of dictionaries, one dictionary - data for one cat

@end

@implementation CATDataSource

- (instancetype)initFromFile:(NSString *)fileName ofType: (NSString *)fileType { //DESIGNATED
    self = [super init];
    if (self) {
        NSBundle *thisApp = [NSBundle mainBundle];
        NSString *pathToCatsData = [thisApp pathForResource:fileName ofType:fileType];
        if ([self loadCatsDataFromFile:pathToCatsData] == NO) {
            NSLog(@"couldn't find data in '%@' file",pathToCatsData);
            return nil;
        }
    }
    return self;
}

- (CATOneCatData *)catAtIndex:(NSUInteger)i {
    if (self.catsArray && ([self.catsArray count] > i) ){
        return [self.catsArray objectAtIndex:i];
    }
    NSLog(@"catAtIndex:%d - wrong index for catsArray or no array at all",i);
    return nil;
}

- (NSUInteger)numberOfCats{
    return [self.catsArray count];
}

- (BOOL)loadCatsDataFromFile:(NSString *)pathToCatsData {
    NSArray *rawCatsData = [NSArray arrayWithContentsOfFile:pathToCatsData];
    if (rawCatsData) {
        self.catsArray = [NSMutableArray array];
        for (NSDictionary *cat in rawCatsData) {
            CATOneCatData *oneCatData = [[CATOneCatData alloc] initWithDictionary:cat];
            [self.catsArray addObject:oneCatData];
        }
        return YES;
    }
    return NO;
}
@end
