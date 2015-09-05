//
//  CATNameValidator.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/25/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATNameValidator.h"

@implementation CATNameValidator

- (BOOL)isValidCatName:(NSString *)name error: (NSError **)error {
    if ([name length] < minCatNameLength) {
        NSString *localizedDescriptionString = [NSString stringWithFormat:NSLocalizedString(@"Name '%@' is too short!",nil),name];
        NSString *localizedReasonString = [NSString stringWithFormat:NSLocalizedString(@"Cat's name can't be shorter than %d symbols.", nil), minCatNameLength];
        *error = [NSError errorWithDomain:@"CATErrorDomain"
                                     code:1
                                 userInfo:@{
                                           NSLocalizedDescriptionKey : NSLocalizedString(localizedDescriptionString, nil),
                                    NSLocalizedFailureReasonErrorKey : NSLocalizedString(localizedReasonString, nil)
                                           }];
        return NO;
    }
    return YES;
}

@end
