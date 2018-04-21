//
//  AppDelegate.h
//  MobileFrame
//
//  Created by Honyar Intelligence on 2018/3/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GTSDK/GeTuiSdk.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,GeTuiSdkDelegate>

@property (strong, nonatomic) UIWindow *window;


//登录页面
-(void)setupLoginViewController;
//跳转到首页
-(void)setupHomeViewController;

@end

