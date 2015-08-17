
#import "CATOneCatData.h"

@implementation CATOneCatData

#warning снова проблемы с форматированием. Перед init не нужен пробел. Затем внутри {} после и перед : нужны пробелы
- (instancetype) init{
    NSDictionary *noCat = @{ @"catName":@"Cat without a name", @"catImgName":@""};
    return [self initWithDictionary:noCat];
}

- (instancetype) initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
#warning здесь потерялся сдвиг вправо
    self.catName = [dict valueForKey:@"catName"];
    self.catPic = [dict valueForKey:@"catImgName"];
#warning старайтесь не писать return посреди метода. Все же возвращайте значение, пускай и пустое, в конце метода в одном return.
    return self;
    }
    else return nil;
}
@end
