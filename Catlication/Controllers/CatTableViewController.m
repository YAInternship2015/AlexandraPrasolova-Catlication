//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATTableViewController.h"
#import "CatTableViewCell.h"
#import "CATDataSource.h"

@interface CATTableViewController ()

@property (nonatomic,strong) CATDataSource *catsDataSource;

@end

@implementation CATTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catsDataSource = [[CATDataSource alloc] initFromFile:@"catsData" ofType:@"plist"]; //set up model
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.catsDataSource numberOfCats]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CATTableViewCell *catsCell = [tableView dequeueReusableCellWithIdentifier:@"cellForCat" forIndexPath:indexPath];
    [catsCell setUpWithModel:[self.catsDataSource catAtIndex:indexPath.row]];
    return catsCell;
}

@end
