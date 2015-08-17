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

- (CATOneCatData *)catAtIndex:(int)i {
#warning при выполнении условия [self.catsArray count] == i приложение упадет. Так что условие в if неверное
    if (self.catsArray && ([self.catsArray count] >= i) ){
        return [self.catsArray objectAtIndex:i];}
#warning слово else здесь писать необязательно. Если сработает if, то выполнение до данной строки не дойдет
    else return nil;
}

- (int) catsNumber{
    if (self.catsArray) {
#warning можно смело возвращать [self.catsArray count] всегда, даже если массив nil, nil умеет отвечать на любые сообщения, возвращая также nil.
        return [self.catsArray count];
    }
    else return 0;
}

#warning инициализаторы должны идти первыми (после методов класса, которые +) в блоке имплементации класса. А вообще стремный инициализатор. Нужен ли он вообще?
- (instancetype)init {
    NSLog(@"better use initFromFile: ofType: to create an instance of CATDataSource..." );
    self = [self initFromFile:@"" ofType:@""];
    return self;
}

- (instancetype)initFromFile:(NSString *)fileName ofType: (NSString *)fileType { //DESIGNATED
    self = [super init];
#warning лучше проверить if (self) и в этом блоке уже провести инициализацию. + всю логику заполнения массива я бы вынес в отдельный метод в этом же классе, вроде loadCatsData
    if (!self) {
        return nil;
    }
    NSBundle *thisApp = [NSBundle mainBundle];
    NSString *pathToCatsData = [thisApp pathForResource:fileName ofType:fileType];
    NSArray *rawCatsData = [NSArray arrayWithContentsOfFile:pathToCatsData];
    if (!rawCatsData) {
        NSLog(@"couldn't find data in '%@' file",pathToCatsData);
        return nil;
    }
    self.catsArray = [NSMutableArray array];
    for (NSDictionary *cat in rawCatsData) {
        [self.catsArray addObject:[[CATOneCatData alloc]initWithDictionary:cat]];
    }
    return self;
}

@end
