//
//  AppDelegate.m
//  MobileFrame
//
//  Created by Honyar Intelligence on 2018/3/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "AppDelegate.h"
#import "introductoryPagesHelper.h"
#import "LoginViewController.h"
#import "HomeViewController.h"

#import "PubHomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //键盘统一收回处理
    [self configureBoardManager];
    
    //加载页面
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupHomeViewController];
    
    //引导页面加载
    [self setupIntroductoryPage];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 键盘收回管理
-(void)configureBoardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField=60;
    manager.enableAutoToolbar = NO;
}

#pragma mark 引导页
-(void)setupIntroductoryPage
{
    if (UserProperties.isNoFirstLaunch)
    {
        return;
    }
    UserProperties.isNoFirstLaunch=YES;
    NSArray *images=@[@"introductoryPage1",@"introductoryPage2",@"introductoryPage3",@"introductoryPage4"];
    [introductoryPagesHelper showIntroductoryPageView:images];
}

#pragma mark 自定义跳转不同的页面
//登录页面
-(void)setupLoginViewController
{
    LoginViewController *loginVc = [[LoginViewController alloc]init];
    self.window.rootViewController = loginVc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

//首页
-(void)setupHomeViewController
{
    PubHomeViewController *tabBarController = [[PubHomeViewController alloc] init];
    [self.window setRootViewController:tabBarController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

@end
