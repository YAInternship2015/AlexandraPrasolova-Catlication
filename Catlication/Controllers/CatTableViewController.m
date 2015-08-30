//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATTableViewController.h"
#import "CatTableViewCell.h"
#import "CATAddCatController.h"

@interface CATTableViewController ()

@property (nonatomic, strong) CATDataSource *catsDataSource;
@property (nonatomic, strong) NSMutableArray *selectedCats; //array of indexPathes for selected cats
@property (nonatomic, strong) UIStoryboard *myStoryboard;

@end

@implementation CATTableViewController

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    self.myStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catsDataSource = [[CATDataSource alloc] initFromFile:@"catsData" ofType:@"plist" withDelegate:self]; //set up model
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
    CATTableViewCell *catCell = [tableView dequeueReusableCellWithIdentifier:@"cellForCat" forIndexPath:indexPath];
    [catCell setUpWithModel:[self.catsDataSource catAtIndex:indexPath.row]];
    return catCell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                          target:self
                                                                                          action:@selector(trashPressed)];
    [self.selectedCats addObject:indexPath];
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.selectedCats removeObject:indexPath]; //cat was deselected, remove it from array of selected cats
    if ([self.selectedCats count] < 1) {        //all selected cats were deselected
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPressed)];
    }
}

- (void) catsDataWasChanged {
    if ([self.catsDataSource reloadCatsData]) {
        [self.tableView reloadData];
    };
}

#pragma mark - Navigation

- (IBAction)unwindToTableViewController:(UIStoryboardSegue *)segue {
    CATAddCatController *sourceViewContr = [segue sourceViewController];
    CATOneCatData *newCat = sourceViewContr.catEntry;
    if (newCat) {
        [self.catsDataSource saveCat:newCat];
    }
}

#pragma mark - Buttons

- (void)addPressed { 
    CATAddCatController *addCatController = [self.myStoryboard instantiateViewControllerWithIdentifier:@"addCatController"];
    [self.navigationController pushViewController:addCatController animated:YES ];
}

- (void)trashPressed {                      //delete all selected cats
    [self.catsDataSource deleteCatsAtIndexes:self.selectedCats];
    [self.selectedCats removeAllObjects];   //all selected cats were deleted, no cats are selected now
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                          target:self
                                                                                          action:@selector(addPressed)];
}

@end
