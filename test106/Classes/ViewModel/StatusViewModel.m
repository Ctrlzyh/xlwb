//
//  StatusViewModel.m
//  test106
//
//  Created by qiaofang on 2021/10/27.
//

#import "StatusViewModel.h"


@implementation StatusViewModel
- (instancetype)initWith:(Status *)status
{
    if (self = [super init]) {
        self.status = status;
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

@end
