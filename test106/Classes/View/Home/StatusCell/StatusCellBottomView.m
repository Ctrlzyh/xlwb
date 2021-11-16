//
//  StatusCellBottomView.m
//  test106
//
//  Created by qiaofang on 2021/10/27.
//

#import "StatusCellBottomView.h"
#import "UIButton+Extension.h"
#import <Masonry/Masonry.h>

@interface StatusCellBottomView ()
@property (nonatomic,strong)UIButton *retweetedButton;
@property (nonatomic,strong)UIButton *commentButton;
@property (nonatomic,strong)UIButton *likeButton;
@end
@implementation StatusCellBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];

    [self addSubview:self.retweetedButton];
    [self addSubview:self.commentButton];
    [self addSubview:self.likeButton];
  
    [self.retweetedButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.bottom.equalTo(self.mas_bottom);
    }];
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.retweetedButton.mas_top);
            make.left.equalTo(self.retweetedButton.mas_right);
            make.width.equalTo(self.retweetedButton.mas_width);
            make.height.equalTo(self.retweetedButton.mas_height);
    }];
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commentButton.mas_top);
        make.left.equalTo(self.commentButton.mas_right);
        make.width.equalTo(self.commentButton.mas_width);
        make.height.equalTo(self.commentButton.mas_height);
        make.right.equalTo(self.mas_right);
    }];
    
    UIView *sep1 = [self sepView];
    UIView *sep2 = [self sepView];
    
    [self addSubview:sep1];
    [self addSubview:sep2];
    
    CGFloat w = 0.5;
    CGFloat scale = 0.4;
    
    [sep1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.retweetedButton.mas_right);
            make.centerY.equalTo(self.retweetedButton.mas_centerY);
            make.width.equalTo(@(w));
            make.height.equalTo(self.retweetedButton.mas_height).multipliedBy(scale);
    }];
    
    [sep2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.commentButton.mas_right);
            make.centerY.equalTo(self.retweetedButton.mas_centerY);
            make.width.equalTo(@(w));
            make.height.equalTo(self.retweetedButton.mas_height).multipliedBy(scale);
    }];
}

- (UIButton *)retweetedButton{
    if(!_retweetedButton){
        _retweetedButton = [UIButton buttonWithTitle:@" 转发" WithFontSize:12 WithTitleColor:[UIColor darkGrayColor] WithImgName:@"timeline_icon_retweet"];
    }
    return _retweetedButton;
}
- (UIButton *)commentButton{
    if(!_commentButton){
        _commentButton = [UIButton buttonWithTitle:@" 评论" WithFontSize:12 WithTitleColor:[UIColor darkGrayColor] WithImgName:@"timeline_icon_comment"];
    }
    return _commentButton;
}
- (UIButton *)likeButton{
    if(!_likeButton){
        _likeButton = [UIButton buttonWithTitle:@" 赞" WithFontSize:12 WithTitleColor:[UIColor darkGrayColor] WithImgName:@"timeline_icon_unlike"];
    }
    return _likeButton;
}

-(UIView *)sepView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor darkGrayColor];
    return view;
}

@end
