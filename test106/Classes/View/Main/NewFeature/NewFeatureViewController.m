//
//  NewFeatureViewController.m
//  test106
//
//  Created by qiaofang on 2021/9/29.
//

#import "NewFeatureViewController.h"
#import "NewFeatureCell.h"

@interface NewFeatureViewController ()

@end

@implementation NewFeatureViewController

static NSString * const reuseIdentifier = @"NewFeatureCellId";
static int const FeatureImageCount = 4;

-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = UIScreen.mainScreen.bounds.size;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.pagingEnabled = true;
    self.collectionView.bounces = false;
    self.collectionView.showsHorizontalScrollIndicator = false;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[NewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return FeatureImageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageIndex = indexPath.item;
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    NSLog(@"-->%d",page);
    if(page == FeatureImageCount - 1){
         
        NewFeatureCell *cell = (NewFeatureCell*)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:page inSection:0]];
        
        [cell showButtonAnim];
    }
}


@end
