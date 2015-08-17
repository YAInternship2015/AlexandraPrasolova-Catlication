
#import <Foundation/Foundation.h>
#import "CATOneCatData.h"

@interface CATDataSource : NSObject

#warning зачем здесь это свойство? достаточно показать метод вроде numberOfCats
@property (readonly) int catsNumber;

#warning лишние пробелы в имени метода. И предпочтительнее испольщовать NSInteger вместо int
- (CATOneCatData *) catAtIndex: (int) i;

#warning лишний пробел в имени селектора
- (instancetype)initFromFile:(NSString *)fileName ofType: (NSString *)fileType; //DESIGNATED

@end

