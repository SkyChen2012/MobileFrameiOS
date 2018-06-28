//
//  BaseAnimationViewController.h
//  MobileFrame
//
//  Created by Benson on 2018/6/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAnimationViewController : UIViewController

// 标题
-(NSString *) controllerTitle;

// 初始化View
-(void)initView;

//按钮操作数组元素
-(NSArray *)operateTitleArray;

//按钮点击事件
-(void)clickBtn:(UIButton *)btn;


@end
