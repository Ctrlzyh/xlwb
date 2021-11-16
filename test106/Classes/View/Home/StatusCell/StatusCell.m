//
//  StatusCell.m
//  test106
//
//  Created by qiaofang on 2021/10/27.
//

#import "StatusCell.h"
#import "StatusCellTopView.h"
#import "StatusCellBottomView.h"
#import "UILabel+Extension.h"
#import <Masonry/Masonry.h>
#import "StatusPictureView.h"

static CGFloat StatusCellMargin = 12.0;
static CGFloat StatusCellIconWidth = 35.0;

@interface StatusCell ()
@property (nonatomic,strong) StatusCellTopView *topView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) StatusCellBottomView *bottomView;
@property (nonatomic,strong) StatusPictureView *pictureView;
@end

@implementation StatusCell
-(void)setViewModel:(StatusViewModel *)viewModel{
    self.topView.viewModel = viewModel;
    self.contentLabel.text = viewModel.status.text;
    
    
    
    
    self.pictureView.viewModel = viewModel;
    [self.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.pictureView.bounds.size.height));
        make.width.equalTo(@(self.pictureView.bounds.size.width));
        CGFloat offset = viewModel.thumbnailUrls.count>0?StatusCellMargin:0;
        make.top.equalTo(self.contentLabel.mas_bottom).offset(offset);
    }];
}

-(CGFloat) rowHeight:(StatusViewModel *)vm{
    self.viewModel = vm;
    [self.contentView layoutIfNeeded];
    
    return CGRectGetMaxY(self.bottomView.frame);
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupUI];
    }
    self.selectionStyle =UITableViewCellSelectionStyleNone;
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self setupUI];
//    }
//    return self;
//}

- (void)setupUI {
    [self.contentView addSubview:self.topView];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.pictureView];
    [self.contentView addSubview:self.bottomView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(@(2 * StatusCellMargin + StatusCellIconWidth));
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom).offset(StatusCellMargin);
            make.left.equalTo(self.contentView.mas_left).offset(StatusCellMargin);
            make.width.lessThanOrEqualTo(@([UIScreen mainScreen].bounds.size.width - 2 * StatusCellMargin));
    }];
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentLabel.mas_bottom).offset(StatusCellMargin);
            make.left.equalTo(self.contentLabel.mas_left);
            make.width.equalTo(@300);
            make.height.equalTo(@90);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pictureView
                             .mas_bottom).offset(StatusCellMargin);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(@(44));
//            make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}

- (StatusCellTopView *)topView {
    if(!_topView){
        _topView =  [[StatusCellTopView alloc] init];
    }
    return _topView;
}

- (UILabel *)contentLabel {
    if(!_contentLabel){
//        _contentLabel =  [[UILabel alloc] labelWithTitle: WithFontSize:15 WithTitleColor:[UIColor darkGrayColor]];
        UILabel *label = [[UILabel alloc] init];
        label.text = @"微博正文";
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        label.numberOfLines = 0;
        _contentLabel = label;
    }
    return _contentLabel;
}

- (StatusCellBottomView *)bottomView {
    if(!_bottomView){
        _bottomView =  [[StatusCellBottomView alloc] init];
    }
    return _bottomView;
}

-(StatusPictureView *)pictureView{
    if(!_pictureView){
        _pictureView = [[StatusPictureView alloc] init];
    }
    return _pictureView;
}


@end
