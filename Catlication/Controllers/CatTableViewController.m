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
#warning тут явно путаница в названии переменной и том, что в ней хранится. Из названия выодит, что в нмассиве лежат модели. По факту, тут лежат индекс пасы. Вообще передавать в датасорс индекс пасы, о которых он и знать не знает - нехорошо. У датасорса есть его массив моделей и индексация по этому массиву. Поэтому ему нужно передавать либо его внутренние индексы, либо сами модели, которые нужно удалить
@property (nonatomic, strong) NSMutableArray *selectedCats; //array of indexPathes for selected cats
#warning Вам здесь не нужна сториборда. Все переходы делаются вызовом segue
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

#warning пробел после (void) не нужен, справедливо для всех методов
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //when one or more cats are selected, add button turnes to trash button
#warning добавление каждой кнопки лучше вынести в отдельные методы, чтобы логика создания кнопок не смешивалась с добавлением/удалением индексов
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                          target:self
                                                                                          action:@selector(trashPressed)];
    [self.selectedCats addObject:indexPath];
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.selectedCats removeObject:indexPath]; //cat was deselected, remove it from array of selected cats
    if ([self.selectedCats count] < 1) {        //all selected cats were deselected, turn trash button to add button
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPressed)];
    }
}

- (void) catsDataWasChanged {
#warning не нужно инициировать перезагрузку данных из контроллера. Датасорс сам должен перевытягивать свои данные, а контроллер только обновляет свой UI
    if ([self.catsDataSource reloadCatsData]) {
        [self.tableView reloadData];
    };
}

#pragma mark - Navigation

- (IBAction)unwindToTableViewController:(UIStoryboardSegue *)segue {
#warning save все же надо делать внутри CATAddCatController, этот контроллер должен только отображать данные
    CATAddCatController *sourceViewContr = [segue sourceViewController];
    CATOneCatData *newCat = sourceViewContr.catEntry;
    if (newCat) {
        [self.catsDataSource saveCat:newCat];
    }
}

#pragma mark - Buttons

- (void)addPressed {
#warning вместо обращения к сториборде лучше вызвать у контроллера метод performSegueWithIdentifier:sender:
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
