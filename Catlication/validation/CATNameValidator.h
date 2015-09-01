//
//  CATNameValidator.h
//  Catlication
//
//  Created by Alexandra Prasolova on 8/25/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CATNameValidator : NSObject

#warning - (BOOL)isValidCatName:(NSString *)name error:(NSError **)error;
- (BOOL)isValidCatName:(NSString *)name Error: (NSError **)error;

@end
