//
//  StatusPictureView.h
//  test106
//
//  Created by qiaofang on 2021/10/28.
//

#import <UIKit/UIKit.h>
#import "StatusViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatusPictureView : UICollectionView
@property (nonatomic,strong) StatusViewModel *viewModel;

@end

@interface StatusPictureViewCell : UICollectionViewCell
@property (nonatomic,copy) NSURL *imgURL;

@end

NS_ASSUME_NONNULL_END
