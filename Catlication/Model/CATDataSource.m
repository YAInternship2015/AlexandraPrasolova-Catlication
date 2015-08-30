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

@property (nonatomic,strong) NSMutableArray *catsArray;     //data model - array of dictionaries, one dictionary - data for one cat
@property (nonatomic, strong) NSString *pathToSourceFile;   //path to file with cats data
@property (weak, nonatomic) UIViewController <CATCatsDataManagment> *delegate;

@end

@implementation CATDataSource

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (instancetype)initFromFile:(NSString *)fileName   //DESIGNATED
                      ofType:(NSString *)fileType
                withDelegate:(UIViewController <CATCatsDataManagment> *)vc {
    self = [super init];
    if (self) {
        NSBundle *thisApp = [NSBundle mainBundle];
        self.pathToSourceFile = [thisApp pathForResource:fileName ofType:fileType];
        if ([self loadCatsDataFromFile:self.pathToSourceFile] == NO) {
            NSLog(@"couldn't find data in '%@' file",self.pathToSourceFile);
            return nil;
        }
    }
    self.delegate =  vc;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(reciveCatSourseFileChangedNotification:)
               name:@"catFileChanged"
             object:nil];
    return self;
}

- (CATOneCatData *)catAtIndex:(NSUInteger)i {
    if (self.catsArray && ([self.catsArray count] > i) ) {
        return [self.catsArray objectAtIndex:i];
    }
    NSLog(@"catAtIndex:%lu - wrong index for catsArray or no array at all",(unsigned long)i);
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

- (void)reciveCatSourseFileChangedNotification:(NSNotification *)notification {
    if ([[notification name] isEqualToString:@"catFileChanged"]) {
        [self.delegate catsDataWasChanged];
    }
}

- (void)saveCat:(CATOneCatData *)newCat {
    NSMutableArray *catsData = [NSMutableArray arrayWithContentsOfFile:self.pathToSourceFile];
    [catsData addObject:[newCat dictionryFromOneCatData]];
    [catsData writeToFile:self.pathToSourceFile atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"catFileChanged" object:nil];
}

- (void)deleteCat:(CATOneCatData *)catToDelete {
    NSMutableArray *catsData = [NSMutableArray arrayWithContentsOfFile:self.pathToSourceFile];
    [catsData removeObject:[catToDelete dictionryFromOneCatData]];
    [catsData writeToFile:self.pathToSourceFile atomically:YES];
}

- (void)deleteCatsAtIndexes:(NSArray *)catsToDelete {
    for (NSIndexPath *catIndex in catsToDelete) {
        [self deleteCat:self.catsArray[catIndex.row]];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"catFileChanged" object:nil];
}

- (BOOL)reloadCatsData {
    if (self) {
        if ([self loadCatsDataFromFile:self.pathToSourceFile] == NO) {
            NSLog(@"couldn't find data in '%@' file",self.pathToSourceFile);
            return NO;
        }
    }
    return YES;
}
@end
