
#import "CATTableViewCell.h"

@interface CATTableViewCell ()

@property (nonatomic, strong) IBOutlet UILabel *catName;
@property (nonatomic, strong) IBOutlet UIImageView *catPic;

@end

@implementation CATTableViewCell

- (void)setUpWithModel:(CATOneCatData *)source {
#warning тут почему-то сдвинулся вправо if
        if (self) {
        self.catName.text = source.catName;
        self.catPic.image = [UIImage imageNamed:source.catPic];
    }
}

@end
