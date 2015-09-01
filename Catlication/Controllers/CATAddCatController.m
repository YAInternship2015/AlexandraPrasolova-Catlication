//
//  CATAddCatController.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/23/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATAddCatController.h"
#import "CATNameValidator.h"

#warning сохранение модели должно происходить в этом контроллере
@interface CATAddCatController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation CATAddCatController

#warning старайтесь не оставлять пустых методов, как этот и следующий. Если не добавляете в них какое-то поведение, то удаляйте
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.saveButton) {
        //cancel button pressed
        return;
    }
    //save button pressed
#warning перед init потеряли пробел
    CATNameValidator *validator = [[CATNameValidator alloc]init];
    NSError *err;
    NSString *catName = self.textField.text;
    if ([validator isValidCatName:catName Error:&err] == NO) {  //cat's name is not valid
        NSLog(@"%@ %@",err.localizedDescription, err.localizedFailureReason);
        [[[UIAlertView alloc] initWithTitle:err.localizedDescription
                                    message:err.localizedFailureReason
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles:nil, nil] show];
        return;
    }
    self.catEntry = [CATOneCatData catWithName:catName andAvatar:@"noavatar.png"];
}

@end
