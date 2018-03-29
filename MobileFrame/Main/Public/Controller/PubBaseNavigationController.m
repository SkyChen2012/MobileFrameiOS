//
//  PubBaseNavigationController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/22.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "PubBaseNavigationController.h"

@interface PubBaseNavigationController ()

@end

@implementation PubBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        //第二级则隐藏底部Tab
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
