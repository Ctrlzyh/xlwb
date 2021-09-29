//
//  VisitorView.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "VisitorView.h"
#import <Masonry/Masonry.h>
#import "UIButton+Extension.h"
#import "UILabel+Extension.h"
#import "UIImageView+Extension.h"

@interface VisitorView ()
@property (nonatomic ,strong) UIImageView *iconView;
@property (nonatomic ,strong) UIImageView *homeIconView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIImageView *maskIconView;

@end
@implementation VisitorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) setupInfoImgName:(NSString *)imgName WithTitle:(NSString *)title{
    self.messageLabel.text = title;
    if(imgName.length){
        self.homeIconView.image = [UIImage imageNamed:imgName];
        self.iconView.hidden = YES;
        [self sendSubviewToBack:self.maskIconView];
    }else{
        [self startAnim];
    }
}

-(void) startAnim{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.toValue = @(2*M_PI);
    anim.repeatCount = MAXFLOAT;
    anim.duration = 20;
    anim.removedOnCompletion = false;
    
    [self.iconView.layer addAnimation:anim forKey:nil];
}

-(void) Login{
    [self.delegate clickLogin];
}
-(void) Register{
    [self.delegate clickRegister];
}
- (instancetype) initWithVisitor{
    if(self == [super init]){
        [self showUI];
    }
    return self;
}

-(void) showUI{
//    self.iconView.frame = CGRectMake(100, 100, 100, 100);
//    self.iconView.backgroundColor = [UIColor redColor];
    self.backgroundColor = [UIColor colorWithWhite:237.0/255.0 alpha:1.0];
//    [self setBackgroundColor:[UIColor redColor]];
    [self addSubview:self.iconView];
    [self addSubview:self.maskIconView];
    [self addSubview:self.homeIconView];
    [self addSubview:self.messageLabel];
    [self addSubview:self.registerButton];
    [self addSubview:self.loginButton];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).offset(-80);
    }];
    [self.homeIconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.iconView.mas_centerX);
            make.centerY.equalTo(self.iconView.mas_centerY);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_bottom).offset(12);
        make.centerX.equalTo(self.iconView.mas_centerX);
        make.left.equalTo(self.mas_left).offset(50);
        make.right.equalTo(self.mas_right).offset(-50);
    }];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.mas_bottom).offset(16);
        make.left.equalTo(self.mas_left).offset(50);
        make.width.equalTo(@100);
        make.height.equalTo(@36);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.mas_bottom).offset(16);
        make.right.equalTo(self.mas_right).offset(-50);
        make.width.equalTo(@100);
        make.height.equalTo(@36);
    }];
    [self.maskIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.loginButton.mas_bottom);
    }];
    
}
-(UIImageView *) iconView{
    if(!_iconView){
        _iconView = [[UIImageView alloc] imgViewWithImgName:@"visitordiscover_feed_image_smallicon"];
    }
    return _iconView;
}

-(UIImageView *) homeIconView {
    if(!_homeIconView){
        _homeIconView = [[UIImageView alloc] imgViewWithImgName:@"visitordiscover_feed_image_house"];
    }
    return _homeIconView;
}

-(UILabel *)messageLabel {
    if(!_messageLabel){
        _messageLabel = [[UILabel alloc] labelWithTitle:@"关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜" WithFontSize:14.0 WithTitleColor:[UIColor darkGrayColor]];
    }
    return _messageLabel;
}

-(UIButton *)registerButton{
    if(!_registerButton){
        _registerButton = [[UIButton alloc] buttonWithTitle:@"注册" WithTitleColor:[UIColor orangeColor] WithImgName:@"common_button_white_disable"];
    }
    [_registerButton addTarget:self action:@selector(Register) forControlEvents:UIControlEventTouchUpInside];
    return _registerButton;
}

-(UIButton *)loginButton{
//    [UIButton alloc] button
    if(!_loginButton){
        _loginButton = [[UIButton alloc] buttonWithTitle:@"登录" WithTitleColor:[UIColor darkGrayColor] WithImgName:@"common_button_white_disable"];
    }
    [_loginButton addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchUpInside];
    return _loginButton;
}

-(UIImageView *)maskIconView{
    if(!_maskIconView){
        _maskIconView = [[UIImageView alloc] init];
        _maskIconView.image = [UIImage imageNamed: @"visitordiscover_feed_mask_smallicon"];
    }
    [_maskIconView sizeToFit];
    return _maskIconView;
}
@end
