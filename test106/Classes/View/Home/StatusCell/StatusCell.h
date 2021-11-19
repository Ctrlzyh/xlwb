//
//  StatusCell.h
//  test106
//
//  Created by qiaofang on 2021/10/27.
//

#import <UIKit/UIKit.h>
#import "StatusViewModel.h"
#import "StatusCellBottomView.h"
#import "StatusPictureView.h"


NS_ASSUME_NONNULL_BEGIN

@interface StatusCell : UITableViewCell
@property (nonatomic,strong) StatusViewModel *viewModel;
@property (nonatomic,strong) StatusCellBottomView *bottomView;
@property (nonatomic,strong) StatusPictureView *pictureView;
@property (nonatomic,strong) UILabel *contentLabel;


-(CGFloat) rowHeight:(StatusViewModel *)vm;
- (void)setupUI;
@end

NS_ASSUME_NONNULL_END
