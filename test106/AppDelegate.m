//
//  AppDelegate.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "NewFeatureViewController.h"
#import "WelcomeViewController.h"
#import "UserAccontViewModel.h"

@interface AppDelegate ()
@property (nonatomic,strong) UIViewController *defaultRootViewController;
@end

@implementation AppDelegate
//-(void)setImageIndex:(NSInteger)imageIndex{
//    _imageIndex = imageIndex;
//    NSString *imgName = [NSString stringWithFormat:@"new_feature_%ld",_imageIndex+1];
//    _iconView.image = [UIImage imageNamed: imgName];
//    self.startButton.hidden = YES;
//}
-(UIViewController *)setDefaultRootViewController{
    if([[UserAccontViewModel alloc] getUserAccount]){
        return [self isNewVersion] ?
        [[NewFeatureViewController alloc] init] :
        [[WelcomeViewController alloc] init];
    } else {
        return [[MainViewController alloc] init];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupAppearance];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    MainViewController *controller = [[MainViewController alloc] init];
//    WelcomeViewController *controller = [[WelcomeViewController alloc] init];
    [self.window setRootViewController:self.setDefaultRootViewController];
//    controller.view.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:WBSwitchRootViewControllerNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        UIViewController *vc = note.object != nil ?
        [[WelcomeViewController alloc] init]:
        [[MainViewController alloc] init];
        self.window.rootViewController = vc;
    }];

    return YES;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:WBSwitchRootViewControllerNotification object:nil];
}

-(void)setupAppearance{
    UINavigationBar.appearance.tintColor = WBAppearanceTintColor;
    UITabBar.appearance.tintColor = WBAppearanceTintColor;
}

- (BOOL)isNewVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *applocalversion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:applocalversion];
    double version = [decNumber doubleValue];

    NSLog(@"-1-->%f",version);
    
    NSString *sandboxVersionKey = @"sandboxVersionKey";
    
    double sandboxVersion = [[NSUserDefaults standardUserDefaults] doubleForKey: sandboxVersionKey];
    
    NSLog(@"-2-->%f",sandboxVersion);
    
    [[NSUserDefaults standardUserDefaults] setDouble:version forKey:sandboxVersionKey];
    
    return version > sandboxVersion;
}

@end
