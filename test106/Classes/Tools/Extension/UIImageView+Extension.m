//
//  UIImageView+Extension.m
//  test106
//
//  Created by qiaofang on 2021/9/17.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)
-(instancetype)imgViewWithImgName:(NSString *)imgName{
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed: imgName];
    [imgView sizeToFit];
    return  imgView;
}
@end
