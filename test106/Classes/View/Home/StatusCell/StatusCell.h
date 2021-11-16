//
//  StatusCell.h
//  test106
//
//  Created by qiaofang on 2021/10/27.
//

#import <UIKit/UIKit.h>
#import "StatusViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatusCell : UITableViewCell
@property (nonatomic,strong) StatusViewModel *viewModel;
-(CGFloat) rowHeight:(StatusViewModel *)vm;
@end

NS_ASSUME_NONNULL_END
