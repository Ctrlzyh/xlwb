//
//  StatusCellTopView.m
//  test106
//
//  Created by qiaofang on 2021/10/27.
//

#import "StatusCellTopView.h"
#import "UIImageView+Extension.h"
#import "UILabel+Extension.h"
#import <Masonry/Masonry.h>
#import <SDWebImage.h>


static CGFloat StatusCellMargin = 12.0;
static CGFloat StatusCellIconWidth = 35.0;


@interface StatusCellTopView ()
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *memberIconView;
@property(nonatomic,strong)UIImageView *vipIconView;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *sourceLabel;
@end

@implementation StatusCellTopView
-(void)setViewModel:(StatusViewModel *)viewModel{
    self.nameLabel.text = viewModel.status.user.screen_name;
    [self.iconView sd_setImageWithURL:viewModel.userProfileurl placeholderImage:viewModel.userDefaultIconView];
    self.memberIconView.image = viewModel.userMemberImage;
    self.vipIconView.image = viewModel.userVipImage;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.memberIconView];
    [self addSubview:self.vipIconView];
    [self addSubview:self.timeLabel];
    [self addSubview:self.sourceLabel];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(StatusCellMargin);
        make.left.equalTo(self.mas_left).offset(StatusCellMargin);
        make.width.equalTo(@(StatusCellIconWidth));
        make.height.equalTo(@(StatusCellIconWidth));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_top);
        make.left.equalTo(self.iconView.mas_right).offset(StatusCellMargin);
    }];
    [self.memberIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_top);
        make.left.equalTo(self.nameLabel.mas_right).offset(StatusCellMargin);
    }];
    [self.vipIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconView.mas_right);
        make.centerY.equalTo(self.iconView.mas_bottom);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.iconView.mas_bottom);
        make.left.equalTo(self.iconView.mas_right).offset(StatusCellMargin);
    }];
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.timeLabel.mas_bottom);
        make.left.equalTo(self.timeLabel.mas_right).offset(StatusCellMargin);
    }];
}

- (UIImageView*)iconView {
    if(!_iconView){
        _iconView = [UIImageView initWithImaName:@"avatar_default_big"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if(!_nameLabel){
        _nameLabel = [UILabel initWithTitle:@"王老五" WithFontSize:14 WithTitleColor:[UIColor darkGrayColor]];
    }
    return _nameLabel;
}

- (UIImageView*)memberIconView {
    if(!_memberIconView){
        _memberIconView = [UIImageView initWithImaName:@"common_icon_membership_level1"];
    }
    return _memberIconView;
}

- (UIImageView*)vipIconView {
    if(!_vipIconView){
        _vipIconView = [UIImageView initWithImaName:@"avatar_vip"];
    }
    return _vipIconView;
}

- (UILabel *)timeLabel {
    if(!_timeLabel){
        _timeLabel = [UILabel initWithTitle:@"现在" WithFontSize:11 WithTitleColor:[UIColor orangeColor]];
    }
    return _timeLabel;
}

- (UILabel *)sourceLabel {
    if(!_sourceLabel){
        _sourceLabel = [UILabel initWithTitle:@"来源" WithFontSize:11 WithTitleColor:[UIColor darkGrayColor]];
    }
    return _sourceLabel;
}



@end
