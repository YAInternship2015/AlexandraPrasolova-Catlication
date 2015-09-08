//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATDataSource.h"
#import "NSBundle+PathToCats.h"

@interface CATDataSource ()

@property (nonatomic, strong) NSMutableArray *catsArray;    //data model - array of dictionaries, one dictionary - data for one cat
@property (nonatomic, strong) NSString *pathToCatsSourceFile;   //path to file with cats data
#warning (nonatomic, weak)
@property (weak, nonatomic) id <CATCatsDataManagment> delegate;

@end

@implementation CATDataSource

- (instancetype)initWithDelegate:(UIViewController <CATCatsDataManagment> *)vc {
    self = [super init];
    if (self) {
        self.pathToCatsSourceFile = [NSBundle pathToCatsFile];
        if ([self loadCatsDataFromFile:self.pathToCatsSourceFile] == NO) {
            NSLog(@"couldn't find data in '%@' file",self.pathToCatsSourceFile);
            return nil;
        }
    }
    self.delegate =  vc;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(receiveCatSourseFileChangedNotification:)
               name:CATDataSourceDataWasChangedNotificationName
             object:nil];
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (CATOneCatData *)catAtIndex:(NSUInteger)i {
    if (self.catsArray && ([self.catsArray count] > i) ) {
        return [self.catsArray objectAtIndex:i];
    }
    NSLog(@"catAtIndex:%lu - wrong index for catsArray or no array at all",(unsigned long)i);
    return nil;
}

- (NSUInteger)numberOfCats {
    return [self.catsArray count];
}

- (BOOL)loadCatsDataFromFile:(NSString *)pathToCatsData {
    BOOL didLoad = NO;
    NSArray *rawCatsData = [NSArray arrayWithContentsOfFile:pathToCatsData];
    if (rawCatsData) {
        self.catsArray = [NSMutableArray array];
            for (NSDictionary *cat in rawCatsData) {
            CATOneCatData *oneCatData = [[CATOneCatData alloc] initWithDictionary:cat];
            [self.catsArray addObject:oneCatData];
            }
        didLoad = YES;
    }
    return didLoad;
}

- (void)receiveCatSourseFileChangedNotification:(NSNotification *)notification {
    [self reloadCatsData];
    if ([self.delegate respondsToSelector:@selector(catsDataWasChanged)]) {
        [self.delegate catsDataWasChanged];
    }
}

- (BOOL)reloadCatsData {
    BOOL didReaload = NO;
    if ((didReaload = [self loadCatsDataFromFile:self.pathToCatsSourceFile]) == NO) {
        NSLog(@"couldn't find data in '%@' file",self.pathToCatsSourceFile);
    }
    return didReaload;
}
@end
