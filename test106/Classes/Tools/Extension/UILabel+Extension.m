//
//  UILabel+Extension.m
//  test106
//
//  Created by qiaofang on 2021/9/17.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
-(instancetype)labelWithTitle:(NSString *)title WithFontSize:(CGFloat)fontSize WithTitleColor:(UIColor *)titleColor{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = titleColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}
+(instancetype)initWithTitle:(NSString *)title WithFontSize:(CGFloat)fontSize WithTitleColor:(UIColor *)titleColor{
    return [[self alloc] labelWithTitle:title WithFontSize:fontSize WithTitleColor:titleColor];
}
@end
