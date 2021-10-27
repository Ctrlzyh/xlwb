//
//  StatusViewModel.h
//  test106
//
//  Created by qiaofang on 2021/10/27.
//

#import <UIKit/UIKit.h>
#import "Status.h"
NS_ASSUME_NONNULL_BEGIN

@interface StatusViewModel : NSObject
@property (nonatomic,strong) Status *status;
@property (nonatomic,strong) NSURL *userProfileurl;
@property (nonatomic,strong) UIImage *userDefaultIconView;
@property (nonatomic,strong) UIImage *userMemberImage;
@property (nonatomic,strong) UIImage *userVipImage;
+ (instancetype)statusWith:(Status *)status;
@end

NS_ASSUME_NONNULL_END
