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
#warning я имел ввиду вот такое написание.
//    if (self.catsArray && ([self.catsArray count] > i) ){
//        return [self.catsArray objectAtIndex:i];
//    }
//    return nil;
#warning Хотя последнее время встречаю все больше противников множественных return в одном методе, по их мнению правильнее так
//    CATOneCatData *catData;
//    if (self.catsArray && ([self.catsArray count] > i) ){
//        catData = [self.catsArray objectAtIndex:i];
//    }
//    return catData;
    
    
    
}

- (NSUInteger)numberOfCats{
    return [self.catsArray count];
}

- (BOOL)loadCatsDataFromFile:(NSString *)pathToCatsData {
#warning здесь не нужна пустая строка
    NSArray *rawCatsData = [NSArray arrayWithContentsOfFile:pathToCatsData];
    if (rawCatsData) {
        self.catsArray = [NSMutableArray array];
        for (NSDictionary *cat in rawCatsData) {
#warning в следующей строке перед init должен быть пробел. А вообще лучше эту строку разбить на две. В первой создавать обхект и второй его добавлять в массив. Иначе многовато скобок выходит
            [self.catsArray addObject:[[CATOneCatData alloc]initWithDictionary:cat]];
        }
        return YES;
    }
#warning тут снова не нужен else :D
    else return NO;
}
@end
