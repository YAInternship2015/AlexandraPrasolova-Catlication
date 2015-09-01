//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATOneCatData.h"

@interface CATOneCatData ()

#warning readwrite можно не писать
@property (nonatomic, strong, readwrite) NSString *catName;
#warning catPic - не лучшее название. catImageName
@property (nonatomic, strong, readwrite) NSString *catPic;

@end

@implementation CATOneCatData

+ (instancetype)catWithName:(NSString *)catName andAvatar:(NSString *)catPic {
    NSDictionary *newCat = @{ @"catName" : catName, @"catImgName" : catPic };
    return [[CATOneCatData alloc]initWithDictionary:newCat];
}

- (instancetype)init {
#warning @"Cat without a name" = это текст, который появляется в коде и который увидит юзер в UI. Его нужно вынести в файл Localizable.strings, почитайте, что это, в гугл
    NSDictionary *noCat = @{ @"catName" : @"Cat without a name", @"catImgName" : @""};
    return [self initWithDictionary:noCat];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.catName = [dict valueForKey:@"catName"];
        self.catPic = [dict valueForKey:@"catImgName"];
    }
    return self;
}

- (NSDictionary *)dictionryFromOneCatData {
#warning лучше использовать современный синтаксис создания словаря, @{ @"catName" : self.catName, @"catImgName" : self.catPic }
    NSDictionary *catDict = [NSDictionary dictionaryWithObjectsAndKeys:self.catName, @"catName", self.catPic, @"catImgName", nil];
    return catDict;
}
@end
