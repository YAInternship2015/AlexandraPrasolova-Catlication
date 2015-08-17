
#import <Foundation/Foundation.h>

@interface CATOneCatData : NSObject 

#warning не стоит показывать в *.h файле свойства с доступом readwrite. Так их значения можно будет изменять извне. В *.h файле из стоит показать как readonly, а в *.m - как readwrite.
#warning такде не забывайте всегда писать nonatomic/atomic и strong/assign/copy/weak
@property NSString *catName;
@property NSString *catPic;

#warning тут лишние пробелы в имени
- (instancetype) initWithDictionary: (NSDictionary *) dict;//DESIGNATED

@end
