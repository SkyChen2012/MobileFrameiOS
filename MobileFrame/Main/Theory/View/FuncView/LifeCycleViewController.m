//
//  LifeCycleViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/22.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LifeCycleViewController.h"

@interface LifeCycleViewController ()

@property(nonatomic,strong)UIView *myView,*myOtherView;

@end

@implementation LifeCycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"第一个VC viewDidLoad");
    self.view.backgroundColor=[UIColor whiteColor];
    
    if (!self.myView) {
        self.myView=[[UIView alloc]init];
        self.myView.backgroundColor=[UIColor redColor];
        [self.view addSubview:self.myView];
        [self.myView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_left).with.offset(5);
            make.centerY.mas_equalTo(self.view).with.offset(0);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
    }
    
    if (!self.myOtherView) {
        self.myOtherView=[[UIView alloc]init];
        self.myOtherView.backgroundColor=[UIColor yellowColor];
        [self.view addSubview:self.myOtherView];
        [self.myOtherView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.view.mas_right).with.offset(5);
            make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(5);
            make.size.mas_equalTo(CGSizeMake(100, 30));
        }];
    }
    
    UIButton *btn =[UIButton new];
    btn.backgroundColor =[UIColor brownColor];
    btn.titleLabel.text = @"fuck";
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50);  
        make.right.equalTo(self.view.mas_right).offset(-50);  
        make.top.equalTo(self.view.mas_top).offset(150);  
        make.height.mas_equalTo(50);  
    }];
    
    
    //左边视图  
    UIView *rightView = [[UIView alloc] init];  
    rightView.backgroundColor = [UIColor redColor];  
    [self.view addSubview:rightView];  
    //右边视图  
    UIView *leftView = [[UIView alloc] init];  
    leftView.backgroundColor = [UIColor greenColor];  
    [self.view addSubview:leftView];  
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.centerY.mas_equalTo(self.view.mas_centerY);  
        make.height.mas_equalTo(150);  
        make.width.mas_equalTo(leftView.mas_width);  
        make.left.mas_equalTo(self.view.mas_left).with.offset(10);  
        make.right.mas_equalTo(leftView.mas_left).with.offset(-10);  
    }];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.centerY.mas_equalTo(self.view.mas_centerY);  
        make.height.mas_equalTo(150);  
        make.width.mas_equalTo(rightView.mas_width);  
        make.left.mas_equalTo(rightView.mas_right).with.offset(10);  
        make.right.mas_equalTo(self.view.mas_right).with.offset(-10);  
    }];  
    
    
    
    NSLog(@"myView当前的坐标：: %@",NSStringFromCGRect(self.myView.frame));
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    
    NSLog(@"myView当前的坐标：: %@",NSStringFromCGRect(self.myView.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    NSLog(@"viewWillDisappear");
}

-(void)loadView
{
    [super loadView];
    NSLog(@"loadView");
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
    
    NSLog(@"myView当前的坐标：: %@",NSStringFromCGRect(self.myView.frame));
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
    
    NSLog(@"myView当前的坐标：: %@",NSStringFromCGRect(self.myView.frame));
    
    NSLog(@"---------------");
    NSLog(@"坐标值，要到viewDidLayoutSubviews 才正确。根视图的大小改变了，子视图必须相应做出调整才可以正确显示，这就是为什么要在 viewDidLayoutSubviews 中调整动态视图的frame");
    NSLog(@"---------------");
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"第一个VC viewDidAppear");
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    NSLog(@"第一个VC viewDidDisappear");
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"第一个VC awakeFromNib");
}


#pragma mark - 重写BaseViewController设置内容

//设置导航栏背景色
-(UIColor*)set_colorBackground
{
    return [UIColor whiteColor];
}

//是否隐藏导航栏底部的黑线 默认也为NO
-(BOOL)hideNavigationBottomLine
{
    return NO;
}

////设置标题
-(NSMutableAttributedString*)setTitle
{
    return [self changeTitle:@"ViewController生命周期"];
}

//设置左边按键
-(UIButton*)set_leftButton
{
    UIButton *left_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateHighlighted];
    return left_button;
}

//设置左边事件
-(void)left_button_event:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 自定义代码

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    return title;
}
@end
