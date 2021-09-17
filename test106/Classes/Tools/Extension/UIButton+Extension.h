//
//  UIButton+Extension.h
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extension)
- (instancetype)buttonWithImgName:(NSString *)imgName WithBgImgName:(NSString *)bgImgName;
- (instancetype)buttonWithTitle:(NSString *)title WithTitleColor:(UIColor *)color WithImgName:(NSString *)imgName;
@end

NS_ASSUME_NONNULL_END
