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

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupAppearance];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    MainViewController *controller = [[MainViewController alloc] init];
    WelcomeViewController *controller = [[WelcomeViewController alloc] init];
    [self.window setRootViewController:controller];
//    controller.view.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self isNewVersion];
    return YES;
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
