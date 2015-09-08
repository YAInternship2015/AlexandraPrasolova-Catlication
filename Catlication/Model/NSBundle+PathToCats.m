//
//  NSBundle+PathToCats.m
//  Catlication
//
//  Created by Alexandra Prasolova on 9/3/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "NSBundle+PathToCats.h"

@implementation NSBundle (PathToCats)

+ (NSString *) pathToCatsFile {
    NSBundle *thisApp = [NSBundle mainBundle];
    return [thisApp pathForResource:catsSourceFileName ofType:catsSourceFileType];
}

@end
