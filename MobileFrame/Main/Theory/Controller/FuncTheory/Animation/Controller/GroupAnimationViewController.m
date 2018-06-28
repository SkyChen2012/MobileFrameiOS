//
//  GroupAnimationViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/6/27.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "GroupAnimationViewController.h"

@interface GroupAnimationViewController ()

@property(nonatomic,strong) UIView *AnimationView;

@end

@implementation GroupAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _AnimationView = [[UIView alloc] initWithFrame:CGRectMake(Main_Screen_Width/2 - 25, Main_Screen_Height/2 -25, 50, 50)];
    _AnimationView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:_AnimationView];
}

-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"同时",@"连续", nil];
}

-(void)clickBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self groupAnimation_Simultaneously];
            break;
        case 1:
            [self groupAnimation_Continuity];
            break;
        default:
            break;
    }
}

-(NSString *)controllerTitle{
    
    return @"组动画";
}


//同时 动画
-(void)groupAnimation_Simultaneously{
 
    //位移 动画
    CAKeyframeAnimation *animation_1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, Main_Screen_Height/2 - 50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width/3, Main_Screen_Height/2 - 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width/3, Main_Screen_Height/2 + 50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width/2, Main_Screen_Height/2 + 50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width/2, Main_Screen_Height/2 - 50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width*2/3, Main_Screen_Height/2 - 50)];
    
    animation_1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    
    //缩放 动画
    CABasicAnimation *animation_2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation_2.fromValue = [NSNumber numberWithFloat:0.8f];
    animation_2.toValue = [NSNumber numberWithFloat:2.0f];
    
    //旋转
    CABasicAnimation *animation_3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation_3.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    //组合动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:animation_1,animation_2,animation_3, nil];
    groupAnimation.duration = 4.0f;
    
    [_AnimationView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
}

//连续 动画
-(void)groupAnimation_Continuity{
    
    CFTimeInterval currentTime = CACurrentMediaTime();
    
    CABasicAnimation *animation_1 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation_1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, Main_Screen_Height/2 - 75)];
    animation_1.toValue = [NSValue valueWithCGPoint:CGPointMake(Main_Screen_Width/2, Main_Screen_Height/2 - 75)];
    animation_1.beginTime = currentTime;
    animation_1.duration = 2.0f;
    animation_1.fillMode = kCAFillModeForwards;
    animation_1.removedOnCompletion = NO;
    [_AnimationView.layer addAnimation:animation_1 forKey:@"positionAnimation"];
    
    CABasicAnimation *animation_2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation_2.fromValue = [NSNumber numberWithFloat:0.8f];
    animation_2.toValue = [NSNumber numberWithFloat:2.0f];
    animation_2.beginTime = currentTime + 1.0f;
    animation_2.duration = 1.0f;
    animation_2.fillMode = kCAFillModeForwards;
    animation_2.removedOnCompletion = NO;
    [_AnimationView.layer addAnimation:animation_2 forKey:@"transformScaleAnimation"];
    
    CABasicAnimation *animation_3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation_3.toValue = [NSNumber numberWithFloat:M_PI*4];
    animation_3.beginTime = currentTime + 2.0f;
    animation_3.duration = 1.0f;
    animation_3.fillMode = kCAFillModeForwards;
    animation_3.removedOnCompletion = NO;
    [_AnimationView.layer addAnimation:animation_3 forKey:@"transformRotationAnimation"];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
