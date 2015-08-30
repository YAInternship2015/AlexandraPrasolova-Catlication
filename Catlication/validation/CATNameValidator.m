//
//  CATNameValidator.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/25/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATNameValidator.h"
#define MIN_CAT_NAME_LENGTH 3

@implementation CATNameValidator

- (BOOL)isValidCatName:(NSString *)name Error: (NSError **)error {
    if ([name length] < MIN_CAT_NAME_LENGTH) {
        NSString *localizedDescriptionString = [NSString stringWithFormat:@"Name '%@' is too short!",name];
        NSString *localizedReasonString = [NSString stringWithFormat:@"Cat's name can't be shorter than %d symbols.",MIN_CAT_NAME_LENGTH];
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
