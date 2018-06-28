//
//  AnimationViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/6/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (nonatomic ,strong )UIView *AnimationView;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _AnimationView = [[UIView alloc]initWithFrame:CGRectMake(Main_Screen_Width/2-50, Main_Screen_Height/2 -100, 100, 100)];
    _AnimationView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_AnimationView];
}

-(NSArray *)operateTitleArray{
//    return @[@"位移", @"透明度", @"缩放",@"旋转"];
    return [NSArray arrayWithObjects:@"位移", @"透明度", @"缩放",@"旋转",@"背景色",nil];
}

-(void)clickBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAnimation];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            [self backgroundAnimation];
            break;
            
        default:
            break;
    }
}

-(NSString *)controllerTitle{
    return @"基础动画";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//位移
-(void)positionAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue  valueWithCGPoint:CGPointMake(0, Main_Screen_Height/2 -75)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width, Main_Screen_Height/2 -75)];
    anima.duration = 2.0f;
    
//    anima.fillMode = kCAFillModeForwards;
//    anima.removedOnCompletion = NO;
    
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_AnimationView.layer addAnimation:anima forKey:@"positionAnimation"];
}
//透明度
-(void)opacityAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue =[NSNumber numberWithFloat:1.0f];
    anima.toValue =[NSNumber numberWithFloat:0.1f];
    anima.duration = 5.0f;
        anima.fillMode = kCAFillModeForwards;
        anima.removedOnCompletion = NO;
    [_AnimationView.layer addAnimation:anima forKey:@"opacityAnimation"];
}
//缩放
-(void)scaleAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima.toValue = [NSNumber numberWithFloat:M_PI];
    anima.duration = 2.0f;
    [_AnimationView.layer addAnimation:anima forKey:@"scaleAnimation"];
    
}
//旋转
-(void)rotateAnimation{
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
//    anima.toValue = [NSNumber numberWithFloat:M_PI];
//    anima.duration = 2.0f;
    
//    [_AnimationView.layer addAnimation:anima forKey:@"rotateAnimation"];
    
//    //valueWithCATransform3D作用与layer
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 1)];//绕着矢量（x,y,z）旋转
    anima.duration = 1.0f;
    anima.repeatCount = MAXFLOAT;
    [_AnimationView.layer addAnimation:anima forKey:@"rotateAnimation"];
//
//    //CGAffineTransform作用与View
//    _demoView.transform = CGAffineTransformMakeRotation(0);
//    [UIView animateWithDuration:1.0f animations:^{
//        _demoView.transform = CGAffineTransformMakeRotation(M_PI);
//    } completion:^(BOOL finished) {
//        
//    }];
    
}
//背景色
-(void)backgroundAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) [UIColor greenColor].CGColor;
    anima.duration = 1.0f;
    [_AnimationView.layer addAnimation:anima forKey:@"backgroundAnimation"];
}

@end
