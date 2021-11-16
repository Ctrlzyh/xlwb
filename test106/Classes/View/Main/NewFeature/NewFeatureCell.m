//
//  NewFeatureCell.m
//  test106
//
//  Created by qiaofang on 2021/9/29.
//

#import "NewFeatureCell.h"
#import "UIButton+Extension.h"
#import <Masonry/Masonry.h>

@interface NewFeatureCell ()
@property (nonatomic,strong)UIImageView *iconView;
@property (nonatomic,strong)UIButton *startButton;
@end

@implementation NewFeatureCell

-(void)setImageIndex:(NSInteger)imageIndex{
    _imageIndex = imageIndex;
    NSString *imgName = [NSString stringWithFormat:@"new_feature_%ld",_imageIndex+1];
    _iconView.image = [UIImage imageNamed: imgName];
    self.startButton.hidden = YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)showButtonAnim {
    self.startButton.hidden = NO;
    self.startButton.userInteractionEnabled = NO;
    self.startButton.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:1.6 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.startButton.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            self.startButton.userInteractionEnabled = YES;
        }];
}

- (void)clickStratButton {
    NSLog(@"开始体验");
    [[NSNotificationCenter defaultCenter] postNotificationName:WBSwitchRootViewControllerNotification object:nil];
}

- (void)buildUI {
    _iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconView];
    _iconView.frame = self.contentView.bounds;
    _iconView.backgroundColor = [UIColor yellowColor];
    
    _startButton = [[UIButton alloc] buttonWithTitle:@"开始体验" WithTitleColor:[UIColor whiteColor] WithBackImgName:@"new_feature_finish_button"];
    [self.contentView addSubview:_startButton];
    [_startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.contentView.mas_bottom).multipliedBy(0.7);
    }];
    [_startButton addTarget:self action:@selector(clickStratButton) forControlEvents:UIControlEventTouchUpInside];
    
    
}

@end
