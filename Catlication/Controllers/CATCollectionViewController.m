//
//  CATCollectionCollectionViewController.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/22/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import "CATCollectionViewController.h"
#import "CATCollectionViewCell.h"

@interface CATCollectionViewController ()

@property (nonatomic,strong) CATDataSource *catsDataSource;

@end

@implementation CATCollectionViewController

static NSString * const reuseIdentifier = @"CatCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catsDataSource = [[CATDataSource alloc] initFromFile:@"catsData" ofType:@"plist" withDelegate:self]; //set up model
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if ([self.catsDataSource reloadCatsData]) {
        [self.collectionView reloadData];
    };
}

@end
