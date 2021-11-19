//
//  StatusRetweetedCell.m
//  test106
//
//  Created by qiaofang on 2021/11/17.
//

#import "StatusRetweetedCell.h"
#import "UILabel+Extension.h"
#import <Masonry/Masonry.h>

static CGFloat StatusCellMargin = 12.0;

@interface StatusRetweetedCell ()
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UILabel *retweetedLabel;
@end

@implementation StatusRetweetedCell
- (void)setViewModel:(StatusViewModel *)viewModel{
    [super setViewModel:viewModel];
    self.retweetedLabel.text = viewModel.retweetedText;
    [self.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat offset = viewModel.thumbnailUrls.count>0?StatusCellMargin:0;
        make.top.equalTo(self.retweetedLabel.mas_bottom).offset(offset);
    }];
}

- (UIButton *)backButton {
    if(!_backButton){
        _backButton =  [[UIButton alloc] init];
//        _backButton.backgroundColor = [UIColor redColor];
        _backButton.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    }
    return _backButton;
}

- (UILabel *)retweetedLabel {
    if(!_retweetedLabel){
        UILabel *label = [[UILabel alloc] init];
        label.text = @"转发微博转发微博转发微博转发微博转发微博转发微博转发微博转发微博转发微博";
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        _retweetedLabel = label;
    }
    return _retweetedLabel;
}

//setupUI
- (void)setupUI {
    [super setupUI];
//    [self.contentView addSubview:self.backButton];
    [self.contentView insertSubview:self.backButton belowSubview:self.pictureView];
    [self.contentView insertSubview:self.retweetedLabel aboveSubview:self.backButton];

    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(StatusCellMargin);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.bottomView.mas_top);
    }];
    
    [self.retweetedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backButton.mas_top).offset(StatusCellMargin);
            make.left.equalTo(self.backButton.mas_left).offset(StatusCellMargin);
            make.width.lessThanOrEqualTo(@([UIScreen mainScreen].bounds.size.width - 2 * StatusCellMargin));
    }];
    
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
               make.top.equalTo(self.retweetedLabel.mas_bottom).offset(StatusCellMargin);
               make.left.equalTo(self.contentLabel.mas_left);
               make.width.equalTo(@300);
               make.height.equalTo(@90);
       }];
}
@end
