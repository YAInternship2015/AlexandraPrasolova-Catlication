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

#warning (nonatomic, strong)
@property (nonatomic,strong) NSMutableArray *catsArray;     //data model - array of dictionaries, one dictionary - data for one cat
@property (nonatomic, strong) NSString *pathToSourceFile;   //path to file with cats data
#warning @property (nonatomic, weak) id<CATCatsDataManagment> delegate; - делегат необязательно должен быть вью контроллером
@property (weak, nonatomic) UIViewController <CATCatsDataManagment> *delegate;

@end

@implementation CATDataSource

#warning dealloc лучше размещать после инитов
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (instancetype)initFromFile:(NSString *)fileName   //DESIGNATED
                      ofType:(NSString *)fileType
                withDelegate:(UIViewController <CATCatsDataManagment> *)vc {
    self = [super init];
    if (self) {
#warning эту логику по формированию пути лучше вынести в отдельный метод, а еще лучше - в категорию к NSBundle
        NSBundle *thisApp = [NSBundle mainBundle];
        self.pathToSourceFile = [thisApp pathForResource:fileName ofType:fileType];
        if ([self loadCatsDataFromFile:self.pathToSourceFile] == NO) {
            NSLog(@"couldn't find data in '%@' file",self.pathToSourceFile);
            return nil;
        }
    }
    self.delegate =  vc;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
#warning имя нотификейшна стоит вынести в отдельный файл типа CATConstants.h и объявить его там константой, так как это имя используется в нескольких местах. Синтаксис вроде такого
//    static NSString *const CATDataSourceDataWasChangedNotificationName = @"CATDataSourceDataWasChangedNotification";
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

#warning нужен пробел перед {
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
#warning постарайтесь отделаться одним return
        return YES;
    }
    return NO;
}

#warning опечатка в имени метода
- (void)reciveCatSourseFileChangedNotification:(NSNotification *)notification {
#warning здесь нужно перевытянуть данные из файла
#warning можно не проверять имя нотификейшна, этот метод вызывается только при появлении этого конкретного нотификейшна
    if ([[notification name] isEqualToString:@"catFileChanged"]) {
#warning перед тем, как вызвать метод у делегата, необходимо убедиться, что он действительно реализовал метод из протокола методов respondsToSelector:, иначе можно поймать креш
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
#warning глупая проверка, она не нужна
    if (self) {
        if ([self loadCatsDataFromFile:self.pathToSourceFile] == NO) {
            NSLog(@"couldn't find data in '%@' file",self.pathToSourceFile);
            return NO;
        }
    }
    return YES;
}
@end
