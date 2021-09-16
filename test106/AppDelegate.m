//
//  AppDelegate.m
//  test106
//
//  Created by qiaofang on 2021/9/16.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MainViewController *controller = [[MainViewController alloc] init];
    [self.window setRootViewController:controller];
//    controller.view.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}




@end
