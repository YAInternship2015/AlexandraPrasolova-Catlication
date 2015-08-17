
#import "CATTableViewController.h"
#import "CatTableViewCell.h"
#import "CATDataSource.h"

@interface CATTableViewController ()

#warning catsDataSource звучит лучше и передает природу объекта
@property (nonatomic) CATDataSource *allCatsData;

@end

@implementation CATTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#warning неправильное форматирование. [[CATDataSource alloc] initFromFile:@"catsData" ofType:@"plist"];
    self.allCatsData = [[CATDataSource alloc]initFromFile:@"catsData"ofType:@"plist"]; //set up model
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allCatsData catsNumber]; //number of rows equals number of cats in data array
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CATTableViewCell *catsCell = [tableView dequeueReusableCellWithIdentifier:@"cellForCat" forIndexPath:indexPath];
#warning здесь надо использовать indexPath.row как индекс объекта
    [catsCell setUpWithModel:[self.allCatsData catAtIndex:indexPath.item]];
    return catsCell;
}

@end
