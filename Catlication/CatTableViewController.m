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

#warning В требованиях к заданию я писал, что нужно создать класс-модель, которая бы хранила в себе картинку и текст. В этом классе-датасорсе внутри (в *.m) был бы один массив моделей, а не массив словарей. Также, в *.h файле необходимо показать минимальный интерфейс, который нужен вью контроллеру для работы, то есть нужен метод, который бы возвращал общее количество моделей, и метод, который бы возвращал модель по индексу (для ячейки). И все, сам массив моделей же показывать не стоит. А вью контролер хранит только ссылку на датасорс

@property (nonatomic,strong) NSArray *catsArray; //data model - array of dictionaries, one dictionary - data for one cat

@end

@implementation CatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning эти методы как раз должны быть инкапсулированы в объекте-датасорсе, о чем я писал в своих общих замечаниях. Не нужно все лепить во вью контроллер
    
    NSBundle *thisApp = [NSBundle mainBundle];
    NSString *pathToCats = [thisApp pathForResource:@"catsData" ofType:@"plist"]; //path to data source
    _catsArray = [NSArray arrayWithContentsOfFile:pathToCats]; //instantiate array from this path
}

#warning по сути пусой метод - надо удалять
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
    
#warning заполнение ячейки данными надо инкапсулировать в самой ячейке
    catsCell.catName.text = particularCat [@"catName"];
    catsCell.catPic.image = [UIImage imageNamed:particularCat[@"catImgName"]];
    
    return catsCell;
}

@end
