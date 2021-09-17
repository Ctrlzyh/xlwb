//
//  VisitorView.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "VisitorView.h"
#import <Masonry/Masonry.h>

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
//+ (void) setupInfoImgName:(NSString *)imgName WithTitle:(NSString *)title{
////    self.messageLabel.text = title;
////    if(imgName){
////        self.iconView.image = [UIImage imageNamed:imgName];
////    }
//}

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
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed: @"visitordiscover_feed_image_smallicon"];
    }
    [_iconView sizeToFit];
    return _iconView;
}

-(UIImageView *) homeIconView {
    if(!_homeIconView){
        _homeIconView = [[UIImageView alloc] init];
        _homeIconView.image = [UIImage imageNamed: @"visitordiscover_feed_image_house"];
    }
    [_homeIconView sizeToFit];
    return _homeIconView;
}

-(UILabel *)messageLabel {
    if(!_messageLabel){
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.text = @"关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜";
        _messageLabel.textColor = [UIColor darkGrayColor];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.numberOfLines = 0;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
//        _messageLabel.backgroundColor = [UIColor redColor];
    }
//    [_messageLabel sizeToFit];
    return _messageLabel;
}

-(UIButton *)registerButton{
    if(!_registerButton){
        _registerButton = [[UIButton alloc] init];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
    }
    return _registerButton;
}

-(UIButton *)loginButton{
    if(!_loginButton){
        _loginButton = [[UIButton alloc] init];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
    }
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
