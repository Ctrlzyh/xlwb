//
//  StatusPictureView.m
//  test106
//
//  Created by qiaofang on 2021/10/28.
//

#import "StatusPictureView.h"
#import <SDWebImage.h>
#import <Masonry/Masonry.h>

static CGFloat StatusPictureViewItemMargin = 8.0;
static CGFloat StatusCellMargin = 12.0;
static NSString *StatusPictureCellId = @"StatusPictureCellId";

@interface StatusPictureView ()<UICollectionViewDataSource>

@end

@implementation StatusPictureView

-(void)setViewModel:(StatusViewModel *)viewModel{
        _viewModel = viewModel;
        [self sizeToFit];
        [self reloadData];
}

- (CGSize)sizeThatFits:(CGSize)size{
    return [self calcViewSize];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    UICollectionViewFlowLayout *lay = [[UICollectionViewFlowLayout alloc] init];
    lay.minimumLineSpacing = StatusPictureViewItemMargin;
    lay.minimumInteritemSpacing = StatusPictureViewItemMargin;
//    lay.scrollDirection =
//    [lay setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    if(self = [super initWithFrame:CGRectZero collectionViewLayout: lay]){
        self.backgroundColor = [UIColor whiteColor];
    }
    
    self.dataSource = self;
    [self registerClass:StatusPictureViewCell.self forCellWithReuseIdentifier:StatusPictureCellId];
    return self;
}

-(CGSize)calcViewSize{
    CGFloat rowCount = 3;
    CGFloat MaxWidth = [UIScreen mainScreen].bounds.size.width-2*StatusCellMargin;
    CGFloat itemWidth = (MaxWidth -2 *StatusPictureViewItemMargin)/rowCount;
    
    UICollectionViewFlowLayout *layout =  (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    
    NSUInteger count = self.viewModel.thumbnailUrls.count;
    
    if(count>=0){
        if(count==0){
            return  CGSizeZero;
        }
        if(count==1){
            CGSize size = CGSizeMake(150, 120);
            NSURL *url = self.viewModel.thumbnailUrls[0];
            UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:[url absoluteString]];
            size = cacheImage.size;
            size.width = size.width < 40 ? 40 : size.width;
            if (size.width > 300){
                CGFloat w = 300;
                CGFloat h = (size.height * w) /size.width;
                size = CGSizeMake(w, h);
            }
            
            layout.itemSize = size;
            return size;
        }
        if(count==4){
            CGFloat w = 2*itemWidth +StatusPictureViewItemMargin;
            return  CGSizeMake(w, w);
        }
        
        CGFloat row = (count-1)/rowCount + 1;
        CGFloat h = row * itemWidth + (row - 1) * StatusPictureViewItemMargin;
        CGFloat w = rowCount * itemWidth+(rowCount-1)*StatusPictureViewItemMargin;
        return  CGSizeMake(w, h);
    }else{
        return  CGSizeZero;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.thumbnailUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StatusPictureViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:StatusPictureCellId forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
//    NSLog(@"--imgURL->%@",self.viewModel.thumbnailUrls[indexPath.item]);
    NSURL *url = self.viewModel.thumbnailUrls[indexPath.item];
//    NSLog(@"--imgURL->%@",url);
    cell.imgURL = url;
    return cell;
}

@end


@interface StatusPictureViewCell ()
@property(nonatomic,strong)UIImageView *iconView;
@end

@implementation StatusPictureViewCell

- (void)setImgURL:(NSURL *)imgURL{
    if(!_imgURL){
        _imgURL = imgURL;
    }
    [self.iconView sd_setImageWithURL:self.imgURL placeholderImage:nil options:SDWebImageRefreshCached];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView.mas_centerY);
//        make.centerX.equalTo(self.contentView.mas_centerX);
        make.edges.equalTo(self.contentView);
    }];
}

- (UIImageView *)iconView{
    if(!_iconView){
        _iconView = [[UIImageView alloc] init];
    }
    _iconView.contentMode = UIViewContentModeScaleAspectFill;
    _iconView.clipsToBounds = YES;
    return _iconView;
}
@end
