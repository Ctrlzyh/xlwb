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

static CGFloat StatusCellMargin = 12.0;
static CGFloat StatusCellIconWidth = 35.0;

@interface StatusCell ()
@property (nonatomic,strong) StatusCellTopView *topView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) StatusCellBottomView *bottomView;
@end

@implementation StatusCell
-(void)setViewModel:(StatusViewModel *)viewModel{
    self.topView.viewModel = viewModel;
    self.contentLabel.text = viewModel.status.text;
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupUI];
    }
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
//    self.contentView
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.equalTo(@(StatusCellMargin+StatusCellIconWidth));
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom).offset(StatusCellMargin);
            make.left.equalTo(self.contentView.mas_left).offset(StatusCellMargin);
            make.width.lessThanOrEqualTo(@([UIScreen mainScreen].bounds.size.width - 2 * StatusCellMargin));
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-12);
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

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
