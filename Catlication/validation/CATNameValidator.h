//
//  CATNameValidator.h
//  Catlication
//
//  Created by Alexandra Prasolova on 8/25/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

@interface CATNameValidator : NSObject

- (BOOL)isValidCatName:(NSString *)name error: (NSError **)error;

@end
