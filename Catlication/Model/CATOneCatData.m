//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATOneCatData.h"

@interface CATOneCatData ()

@property (nonatomic, strong, readwrite) NSString *catName;
@property (nonatomic, strong, readwrite) NSString *catPic;

@end

@implementation CATOneCatData

- (instancetype)init {
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
@end
