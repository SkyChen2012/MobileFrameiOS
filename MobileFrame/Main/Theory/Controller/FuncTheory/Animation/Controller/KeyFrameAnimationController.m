//
//  KeyFrameAnimationController.m
//  MobileFrame
//
//  Created by Benson on 2018/6/19.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "KeyFrameAnimationController.h"

@interface KeyFrameAnimationController ()<CAAnimationDelegate>

@property(nonatomic,strong) UIView *animaView;

@end

@implementation KeyFrameAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _animaView = [[UIView alloc] initWithFrame:CGRectMake(Main_Screen_Width/2 - 25 , Main_Screen_Width /2 - 25 , 50, 50)];
    _animaView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:_animaView];

}

-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"关键帧",@"路径",@"抖动", nil];
}

-(NSString *)controllerTitle{
    return @"关键帧动画";
}

-(void)clickBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self keyFrameAnimation];
            break;
        case 1:
            [self pathAnimation];
            break;
        case 2:
            [self shakeAnimation];
            break;
        default:
            break;
    }
}

//关键帧动画
-(void)keyFrameAnimation{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, Main_Screen_Height/2)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width/2, Main_Screen_Height/2)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width/2, Main_Screen_Height/2 + 50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width*3/2, Main_Screen_Height/2 + 50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width*3/2, Main_Screen_Height/2 - 50)];
    
    anima.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4, nil];
    anima.duration = 4.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anima.delegate = self;//设置代理，可以检测动画的开始和结束
    [_animaView.layer addAnimation:anima forKey:@"keyFrameAnimation"];
    
}

-(void)pathAnimation{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(Main_Screen_Width/2-100, Main_Screen_Height/2-100, 200, 200)];
    anima.path = path.CGPath;
    anima.duration = 2.0f;
    [_animaView.layer addAnimation:anima forKey:@"pathAnimation"];
}

-(void)shakeAnimation{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];//在这里@"transform.rotation"==@"transform.rotation.z"
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    anima.values = @[value1,value2,value3];
    anima.repeatCount = MAXFLOAT;
    
    [_animaView.layer addAnimation:anima forKey:@"shakeAnimation"];
}

-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始动画");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"结束动画");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
