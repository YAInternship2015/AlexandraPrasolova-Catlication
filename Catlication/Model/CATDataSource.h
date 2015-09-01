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

#warning в принципе, так как у нас не подрахумевается наличие нескольких файлов с данными, то можно имя файла и его тип захардкодить где-то в константах. Датасорс будет всегда использовать этот файл, и тогда в инит будет передаваться только делегат
- (instancetype)initFromFile:(NSString *)fileName
                      ofType:(NSString *)fileType
                withDelegate:(UIViewController <CATCatsDataManagment>*)delegate; //DESIGNATED
- (CATOneCatData *)catAtIndex:(NSUInteger)i;
- (NSUInteger)numberOfCats;
- (void)saveCat:(CATOneCatData *)newCat;                //add new cat to source file
#warning сюда должны прийти именно индексы для массива, который есть внутри датасорса, ну или модели, но не индекс пасы
- (void)deleteCatsAtIndexes:(NSArray *)catsToDelete;    //remove cats from source file
- (BOOL)reloadCatsData;                                 //load cats data from source file once again

@end

