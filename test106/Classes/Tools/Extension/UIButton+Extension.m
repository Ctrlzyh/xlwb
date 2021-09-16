//
//  UIButton+Extension.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
- (instancetype)buttonWithImgName:(NSString *)imgName WithBgImgName:(NSString *)bgImgName{
    UIButton *btn = [[UIButton alloc] init];
//    NSString *s = [NSString stringWithFormat:@"%@_highlighted",imgName];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imgName]] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:bgImgName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",bgImgName]] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    return btn;
}
@end
