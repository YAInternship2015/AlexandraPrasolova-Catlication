
#import "CATOneCatData.h"

@implementation CATOneCatData

- (instancetype) init{
    NSDictionary *noCat = @{ @"catName":@"Cat without a name", @"catImgName":@""};
    return [self initWithDictionary:noCat];
}

- (instancetype) initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
    self.catName = [dict valueForKey:@"catName"];
    self.catPic = [dict valueForKey:@"catImgName"];
    return self;
    }
    else return nil;
}
@end
