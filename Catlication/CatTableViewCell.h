//
//  CatTableViewCell.h
//  Catlication
//
//  Created by Alexandra Prasolova on 8/8/15.
//  Copyright (c) 2015 Alexandra Prasolova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatTableViewCell : UITableViewCell

#warning тут проблема с инкапсуляцией. Не нужно показывать наружу (в *.h файле) лишние свойства/методы. Если вы напишите метод вроде setupWithModel:, в котором ячейка сама себя будет заполнять моделью, то объявления свойств переедут в *.m файл. Почитайте еще раз принципы SOLID

@property (nonatomic, strong) IBOutlet UILabel *catName;
@property (nonatomic, strong) IBOutlet UIImageView *catPic;

@end
