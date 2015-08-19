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
        return [self.catsArray objectAtIndex:i];}
#warning слово else здесь писать необязательно. Если сработает if, то выполнение до данной строки не дойдет -- а если я когда-нибудь такого понапишу, что все-таки if не сработает? И еще: без ветки else не компилится т.к. control may reach end of non-void function, а убрать проверку совсем - страшно =)
    else {
        NSLog(@"catAtIndex:%d - wrong index for catsArray or no array at all",i);
        return nil;
    }
}

- (NSUInteger)numberOfCats{
    return [self.catsArray count];
}

- (BOOL)loadCatsDataFromFile:(NSString *)pathToCatsData {
    
    NSArray *rawCatsData = [NSArray arrayWithContentsOfFile:pathToCatsData];
    if (rawCatsData) {
        self.catsArray = [NSMutableArray array];
        for (NSDictionary *cat in rawCatsData) {
            [self.catsArray addObject:[[CATOneCatData alloc]initWithDictionary:cat]];
        }
        return YES;
    }
    else return NO;
}
@end
