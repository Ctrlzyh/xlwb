//
//  MainViewController.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "MainViewController.h"
#import "ProfileTableViewController.h"
#import "DiscoverTableViewController.h"
#import "MessageTableViewController.h"
#import "HomeTableViewController.h"
#import "UIButton+Extension.h"

@interface MainViewController ()
@property (nonatomic,strong) UIButton *composedButton;
@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBar addSubview:self.composedButton];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBarChild];
    [self setUI];
    
//    [self.tabBar setBarTintColor:[UIColor redColor]];
    // Do any additional setup after loading the view.
}

- (void)clickComposedButton{
    NSLog(@"----->");
}


- (void)setUI {
    [self.tabBar setBackgroundColor:[UIColor systemGray6Color]];
    NSUInteger count = self.childViewControllers.count;
    float w = self.tabBar.bounds.size.width / count - 1;
    self.composedButton.frame = CGRectInset(self.tabBar.bounds, 2*w, 0);
    [self.composedButton addTarget:self action:@selector(clickComposedButton) forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)composedButton {
    if(!_composedButton){
        _composedButton = [[UIButton alloc] buttonWithImgName:@"tabbar_compose_icon_add" WithBgImgName:@"tabbar_compose_button"];
    }
    return _composedButton;
}

- (void)setTabBarChild {
//    self.tabBar.tintColor = [UIColor orangeColor];
    [self addChildViewControllers:[[HomeTableViewController alloc] init] WithTitle:@"首页" WithImgName:@"tabbar_home"];
    [self addChildViewControllers:[[MessageTableViewController alloc] init] WithTitle:@"消息" WithImgName:@"tabbar_message_center"];
    [self addChildViewController:[[UIViewController alloc] init]];
    [self addChildViewControllers:[[DiscoverTableViewController alloc] init] WithTitle:@"发现" WithImgName:@"tabbar_discover"];
    [self addChildViewControllers:[[ProfileTableViewController alloc] init] WithTitle:@"我" WithImgName:@"tabbar_profile"];
}

- (void)addChildViewControllers:(UIViewController *)childController WithTitle:(NSString *)title WithImgName:(NSString *)imgName{
    UIViewController *vc = childController;
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed: imgName];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
