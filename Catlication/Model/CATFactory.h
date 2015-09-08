//
//  CATFactory.h
//  Catlication
//
//  Created by Alexandra Prasolova on 9/4/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CATOneCatData;

@interface CATFactory : NSObject

+ (CATOneCatData *)catWithName:(NSString *)catName avatar:(NSString *)catImageName;

@end
