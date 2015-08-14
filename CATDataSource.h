
#import <Foundation/Foundation.h>
#import "CATOneCatData.h"

@interface CATDataSource : NSObject

@property (readonly) int catsNumber;

- (CATOneCatData *) catAtIndex: (int) i;
- (instancetype)initFromFile:(NSString *)fileName ofType: (NSString *)fileType; //DESIGNATED

@end

