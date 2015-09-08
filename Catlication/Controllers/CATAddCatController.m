//
//  CATAddCatController.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/23/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATAddCatController.h"
#import "CATNameValidator.h"
#import "CATDataManager.h"
#import "CATFactory.h"

@interface CATAddCatController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation CATAddCatController

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.saveButton) {
        //cancel button pressed
        return;
    }
    //save button pressed
    CATNameValidator *validator = [[CATNameValidator alloc] init];
    NSError *err;
    NSString *catName = self.textField.text;
    if ([validator isValidCatName:catName error:&err] == NO) {  //cat's name is not valid
        NSLog(@"%@ %@",err.localizedDescription, err.localizedFailureReason);
        [[[UIAlertView alloc] initWithTitle:err.localizedDescription
                                    message:err.localizedFailureReason
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles:nil, nil] show];
        return;
    }
    CATOneCatData *catEntry = [CATFactory catWithName:catName avatar:@"noavatar.png"];
    [self saveCat:catEntry];
}

- (BOOL)saveCat: (CATOneCatData *)cat {
    BOOL successfullySaved = NO;
    [[CATDataManager dataManager]addCat:cat];
    return successfullySaved;
}
@end
