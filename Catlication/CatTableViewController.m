//
//  CatTableViewController.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/8/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CatTableViewController.h"
#import "CatTableViewCell.h"

@interface CatTableViewController ()

@property (nonatomic,strong) NSArray *catsArray; //data model - array of dictionaries, one dictionary - data for one cat

@end

@implementation CatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *thisApp = [NSBundle mainBundle];
    NSString *pathToCats = [thisApp pathForResource:@"catsData" ofType:@"plist"]; //path to data source
    _catsArray = [NSArray arrayWithContentsOfFile:pathToCats]; //instantiate array from this path
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_catsArray count]; //it equals number of cats in data array
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatTableViewCell *catsCell = [tableView dequeueReusableCellWithIdentifier:@"cellForCat" forIndexPath:indexPath];
    
    NSDictionary *particularCat = _catsArray[indexPath.item]; //data for one cat
   //now put cats data into the cell's views:
    catsCell.catName.text = particularCat [@"catName"];
    catsCell.catPic.image = [UIImage imageNamed:particularCat[@"catImgName"]];
    
    return catsCell;
}

@end
