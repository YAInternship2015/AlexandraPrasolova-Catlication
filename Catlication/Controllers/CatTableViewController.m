//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATTableViewController.h"
#import "CATTableViewCell.h"
#import "CATAddCatController.h"
#import "CATDataSource.h"
#import "CATDataManager.h"

@interface CATTableViewController ()

@property (nonatomic, strong) CATDataSource *catsDataSource;

@property (nonatomic, strong) NSMutableArray *selectedCats; //array of  selected cats

@end

@implementation CATTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catsDataSource = [[CATDataSource alloc] initWithDelegate:self]; //set up model
    self.selectedCats = [NSMutableArray array]; //no cats are selected yet
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.catsDataSource numberOfCats]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#warning @"cellForCat" можно вынести в константы в саму ячейку
    CATTableViewCell *catCell = [tableView dequeueReusableCellWithIdentifier:@"cellForCat" forIndexPath:indexPath];
    [catCell setUpWithModel:[self.catsDataSource catAtIndex:indexPath.row]];
    return catCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //when one or more cats are selected, add button turnes to trash button
    [self addTrashButton];
    [self.selectedCats addObject:[self.catsDataSource catAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.selectedCats removeObject:[self.catsDataSource catAtIndex:indexPath.row]]; //cat was deselected, remove it from array of selected cats
    if ([self.selectedCats count] < 1) {        //all selected cats were deselected, turn trash button to add button
        [self addAddButton];
    }
}

- (void)catsDataWasChanged {
    [self.tableView reloadData];
}

#pragma mark - Buttons

- (void)addAddButton {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                          target:self
                                                                                          action:@selector(addPressed)];
}

- (void)addTrashButton {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                          target:self
                                                                                          action:@selector(trashPressed)];
}

#warning лучше addButtonPressed
- (void)addPressed {
    [self performSegueWithIdentifier:@"toAddCatNavigationController" sender:self];
}

- (void)trashPressed {                      //delete all selected cats
    [[CATDataManager dataManager]deleteCatsAtIndexes:self.selectedCats];
    [self.selectedCats removeAllObjects];   //all selected cats were deleted, no cats are selected now
    [self addAddButton];
}

@end
