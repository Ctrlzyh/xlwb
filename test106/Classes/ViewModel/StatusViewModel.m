//
//  StatusViewModel.m
//  test106
//
//  Created by qiaofang on 2021/10/27.
//

#import "StatusViewModel.h"
#import "StatusCell.h"
#import "StatusRetweetedCell.h"
#import "StatusNormalCell.h"

static NSString * const StatusCellNormalId = @"StatusCellNormalId";
static NSString * const StatusRetweetedCellId = @"StatusRetweetedCellId";

@implementation StatusViewModel
- (instancetype)initWith:(Status *)status
{
    if (self = [super init]) {
        self.status = status;
    }
    NSArray *urls = self.status.retweeted_status.pic_urls ? self.status.retweeted_status.pic_urls : self.status.pic_urls;
    if(urls>=0){
        if(!_thumbnailUrls){
            _thumbnailUrls = NSArray.new;
        }
        NSMutableArray *urlList = [NSMutableArray array];
        for(NSDictionary *dict in urls) {
            NSURL *url = [NSURL URLWithString: dict[@"thumbnail_pic"]];
            [urlList addObject:url];
        }
        self.thumbnailUrls = urlList;
    }
    return self;
}

+ (instancetype)statusWith:(Status *)status{
    return [[self alloc] initWith:status];
}

- (NSURL *)userProfileurl{
    return [NSURL URLWithString:self.status.user.profile_image_url];
}

- (UIImage *)userDefaultIconView{
    return [UIImage imageNamed:@"avatar_default_big"];
}

- (UIImage *)userMemberImage{
    if(self.status.user.mbrank>0&&self.status.user.mbrank<7){
        NSString *imageName =[NSString stringWithFormat:@"common_icon_membership_level%d",self.status.user.mbrank];
        return [UIImage imageNamed:imageName];
    }
    return nil;
}

- (UIImage *)userVipImage{
    switch (self.status.user.verified_type) {
        case 0:
            return [UIImage imageNamed:@"avatar_vip"];
        case 2:
        case 3:
        case 5:
            return [UIImage imageNamed:@"avatar_enterprise_vip"];
        case 220:
            return [UIImage imageNamed:@"avatar_grassroot"];
        default:
            return nil;
    }
}

- (NSString *)cellId{
    return self.status.retweeted_status != nil ? StatusRetweetedCellId : StatusCellNormalId;
}

- (CGFloat)rowHeight{
    if (self.status.retweeted_status != nil){
        StatusRetweetedCell *cell = [[StatusRetweetedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StatusRetweetedCellId];
        return [cell rowHeight:self];
    } else {
        StatusNormalCell *cell = [[StatusNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StatusCellNormalId];
        return [cell rowHeight:self];
    }
}

- (NSString *)description{
    return self.status.description;
}

- (NSString *)retweetedText{
    NSString *string = @"";
    if (self.status.retweeted_status){
        string = [string stringByAppendingFormat:@"%@,%@",self.status.retweeted_status.user.screen_name, self.status.retweeted_status.text];

    } else {
        string = nil;
    }
    return  string;
}

@end
