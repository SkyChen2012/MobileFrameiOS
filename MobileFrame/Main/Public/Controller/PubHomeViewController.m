//
//  PubHomeViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/22.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "PubHomeViewController.h"

#import "PubBaseNavigationController.h"

#import "HomeViewController.h"
#import "TheoryViewController.h"
#import "LoginViewController.h"

#import "DiscoveryViewController.h"
@interface PubHomeViewController ()

@end

@implementation PubHomeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTabBarController];
        
        self.tabBar.selectedImageTintColor =RGB(182, 65, 65);
        
        //显示未读
//        UINavigationController  *discoverNav =(UINavigationController *)self.viewControllers[1];
//        UITabBarItem *curTabBarItem=discoverNav.tabBarItem;
//        [curTabBarItem setBadgeValue:@"2"];
    }
    return self;
}

- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes =[self tabBarItemsAttributesForController];
    
    /// 设置控制器数组
    self.viewControllers =[self ViewControllers];
    
    self.delegate = self;
    self.moreNavigationController.navigationBarHidden = YES;
}

//TabBar文字跟图标设置
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"home_normal",
                                                 CYLTabBarItemSelectedImage : @"home_highlight",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"基础",
                                                  CYLTabBarItemImage : @"mycity_normal",
                                                  CYLTabBarItemSelectedImage : @"mycity_highlight",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"服务",
                                                 CYLTabBarItemImage : @"message_normal",
                                                 CYLTabBarItemSelectedImage : @"message_highlight",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"更多",
                                                  CYLTabBarItemImage : @"account_normal",
                                                  CYLTabBarItemSelectedImage : @"account_highlight"
                                                  };
    NSDictionary *fiveTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"登陆",
                                                  CYLTabBarItemImage : @"account_normal",
                                                  CYLTabBarItemSelectedImage : @"account_highlight"
                                                  };
    
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
//                                       thirdTabBarItemsAttributes,
//                                       fourthTabBarItemsAttributes
                                       fiveTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

//控制器设置
- (NSArray *)ViewControllers {
    
    HomeViewController *firstViewController = [[HomeViewController alloc] init];
    UINavigationController *firstNavigationController = [[PubBaseNavigationController alloc]
                                                         initWithRootViewController:firstViewController];
    
    TheoryViewController *secondViewController = [[TheoryViewController alloc] init];
    UINavigationController *secondNavigationController = [[PubBaseNavigationController alloc]
                                                          initWithRootViewController:secondViewController];
    
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    UINavigationController *fiveNavigationController = [[PubBaseNavigationController alloc]
                                                          initWithRootViewController:loginViewController];

//    UMengSocialViewController *thirdViewController = [[UMengSocialViewController alloc] init];
//    UINavigationController *thirdNavigationController = [[MPBaseNavigationController alloc]
//                                                         initWithRootViewController:thirdViewController];
//    
//    MPMoreViewController *fourthViewController = [[MPMoreViewController alloc] init];
//    UINavigationController *fourthNavigationController = [[MPBaseNavigationController alloc]
//                                                          initWithRootViewController:fourthViewController];

    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
//                                 thirdNavigationController,
//                                 fourthNavigationController,
                                 fiveNavigationController
                                 ];
    
    return viewControllers;
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
    /// 特殊处理 - 是否需要登录
    BOOL isBaiDuService = [viewController.topViewController isKindOfClass:[DiscoveryViewController class]];
    if (isBaiDuService) {
        NSLog(@"你点击了TabBar第二个");
    }
    return YES;
}

@end
