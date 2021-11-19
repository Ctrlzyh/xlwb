//
//  StatusNormalCell.m
//  test106
//
//  Created by qiaofang on 2021/11/18.
//

#import "StatusNormalCell.h"
#import <Masonry/Masonry.h>

static CGFloat StatusCellMargin = 12.0;

@implementation StatusNormalCell
-(void)setViewModel:(StatusViewModel *)viewModel{
    [super setViewModel:viewModel];
    [self.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat offset = viewModel.thumbnailUrls.count>0?StatusCellMargin:0;
        make.top.equalTo(self.contentLabel.mas_bottom).offset(offset);
    }];
}

- (void)setupUI {
    [super setupUI];
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentLabel.mas_bottom).offset(StatusCellMargin);
                make.left.equalTo(self.contentLabel.mas_left);
                make.width.equalTo(@300);
                make.height.equalTo(@90);
    }];
}



@end
