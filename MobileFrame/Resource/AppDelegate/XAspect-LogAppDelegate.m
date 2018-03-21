//
//  XAspect-LogAppDelegate.m
//  MobileFrame
//  XAspect Log AppDelegate 代码注入
//  Created by Benson on 2018/3/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "AppDelegate.h"
#import "FileLogger.h"

#if DEBUG
#import "FLEXManager.h"
#endif
#import "XAspect.h"


/**
 必须要有的宏定义, 而且必须写在最前面
 @param AtAspect: 字段固定, 不能修改
 @param LZProjectName: 这个可以自定义, 一般和自己需要注入代码的类有关
*/
#define AtAspect LogAppDelegate

/** 
 需要注入代码的类
 @param AtAspectOfClass: 固定字段, 不能修改
 @param AppDelegate: 需要注入代码的类
 */
#define AtAspectOfClass AppDelegate
// 开辟空间, 这个参数类名需和上面的类一致
@classPatchField(AppDelegate)

/**
 需要添加的方法
 @param - 方法类型: - 实例方法; + 类方法
 @param BOOL 返回值类型
 @param UIApplication 方法实体
 @return 返回
 */
AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions)
{
    //如果是测试本地版本开启调试工具FLEX
#if DEBUG&LOCAL
    [[FLEXManager sharedManager] showExplorer];
#endif
    
    //日志初始化
    [FileLogger sharedManager];
    
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

AspectPatch(-,void,applicationWillResignActive:(UIApplication *)application)
{
    NSLog(@"applicationWillResignActive");
}

@end
#undef AtAspectOfClass
#undef AtAspect
