//
//  UILabel+Extension.h
//  test106
//
//  Created by qiaofang on 2021/9/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Extension)
-(instancetype)labelWithTitle:(NSString *)title WithFontSize:(CGFloat)fontSize WithTitleColor:(UIColor *)titleColor;
+(instancetype)initWithTitle:(NSString *)title WithFontSize:(CGFloat)fontSize WithTitleColor:(UIColor *)titleColor;
@end

NS_ASSUME_NONNULL_END
