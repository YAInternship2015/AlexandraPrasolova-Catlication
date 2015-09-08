//
//  CATCollectionCollectionViewController.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/22/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATCollectionViewController.h"
#import "CATCollectionViewCell.h"
#import "CATDataSource.h"

@interface CATCollectionViewController ()

@property (nonatomic,strong) CATDataSource *catsDataSource;

@end

@implementation CATCollectionViewController

#warning я бы это вынес в саму ячейку
static NSString * const reuseIdentifier = @"CatCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catsDataSource = [[CATDataSource alloc] initWithDelegate:self]; //set up model
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.catsDataSource numberOfCats];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CATCollectionViewCell *catCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [catCell setUpWithModel:[self.catsDataSource catAtIndex:indexPath.row]];
    return catCell;
}

- (void)catsDataWasChanged {
    [self.collectionView reloadData];    
}

@end
