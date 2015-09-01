//
//  CATDataSource.m
//  Catlication
//
//  Created by Alexandra Prasolova on 8/10/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning чтобы не импортировать в *.h целый класс из-за протокола, можно либо показать, что класс реализует протокол уже внутри *.m файла, либо вместо импорта использовать forward declaration вида @protocol CATCatsDataManagment;, которая скажет компилятору, что такой протокол есть, но его реализация будет предоставлена в другом месте. То же самое справедливо для CATCollectionViewController
#import "CATDataSource.h"

@interface CATTableViewController : UITableViewController <CATCatsDataManagment>

@end
