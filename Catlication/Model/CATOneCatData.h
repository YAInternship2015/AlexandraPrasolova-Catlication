//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

@interface CATOneCatData : NSObject 

@property (nonatomic, strong, readonly) NSString *catName;
@property (nonatomic, strong, readonly) NSString *catImageName;

- (instancetype)initWithDictionary:(NSDictionary *)dict;    //DESIGNATED
@end
