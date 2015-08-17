
#import <UIKit/UIKit.h>
#import "CATOneCatData.h"

@interface CATTableViewCell : UITableViewCell

#warning неправильное форматирование. - (void)setUpWithModel:(CATOneCatData *)source;
#warning также почему параметр называется source? может лучше catData?
- (void) setUpWithModel: (CATOneCatData *) source;

@end
