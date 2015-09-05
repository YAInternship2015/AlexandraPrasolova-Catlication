//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATOneCatData.h"

@interface CATOneCatData ()

@property (nonatomic, strong) NSString *catName;
@property (nonatomic, strong) NSString *catImageName;

@end

@implementation CATOneCatData

- (instancetype)init {
    NSDictionary *noCat = @{ @"catName" : NSLocalizedString(@"Cat without a name",nil), @"catImgName" : @""};
    return [self initWithDictionary:noCat];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.catName = [dict valueForKey:@"catName"];
        self.catImageName = [dict valueForKey:@"catImgName"];
    }
    return self;
}

@end
