//
//  WelcomeViewController.m
//  test106
//
//  Created by qiaofang on 2021/10/8.
//

#import "WelcomeViewController.h"
#import "UIImageView+Extension.h"
#import <Masonry/Masonry.h>
#import "UILabel+Extension.h"
#import "UserAccontViewModel.h"
#import <SDWebImage.h>


@interface WelcomeViewController ()
@property (nonatomic,strong)UIImageView *backImgView;
@property (nonatomic,strong)UIImageView *headImgView;
@property (nonatomic,strong)UILabel *welcomeLabel;
@end

@implementation WelcomeViewController
- (void)loadView {
    [super loadView];
    self.view = self.backImgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    [self.headImgView sd_setImageWithURL:[[UserAccontViewModel alloc] avataURL] placeholderImage: [UIImage imageNamed:@"avatar_default_big"]];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-self.view.bounds.size.height + 200);
    }];
    
    self.welcomeLabel.alpha = 0;
    [UIView animateWithDuration:1.2 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^{
            self.welcomeLabel.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }];
    
    
}

- (UIImageView *)backImgView{
    if(!_backImgView){
        _backImgView = [[UIImageView alloc] imgViewWithImgName:@"ad_background"];
    }
    return _backImgView;
}

- (UIImageView *)headImgView{
    if(!_headImgView){
        _headImgView = [[UIImageView alloc] imgViewWithImgName:@"avatar_default_big"];
    }
    _headImgView.layer.cornerRadius = 45;
    _headImgView.layer.masksToBounds = YES;
    return _headImgView;
}

-(UILabel *)welcomeLabel{
    if(!_welcomeLabel){
        _welcomeLabel = [[UILabel alloc] labelWithTitle:@"欢迎归来" WithFontSize:18 WithTitleColor:[UIColor darkGrayColor]];
    }
    return _welcomeLabel;
}

- (void)setUI{
    [self.view addSubview:self.headImgView];
    [self.view addSubview:self.welcomeLabel];
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-200);
        make.width.equalTo(@90);
        make.height.equalTo(@90);
    }];
    [self.welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.headImgView.mas_bottom).offset(16);
    }];
}
@end
