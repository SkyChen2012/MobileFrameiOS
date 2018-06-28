//
//  BaseAnimationViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/6/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseAnimationViewController.h"
#import "Titlebutton.h"


@interface BaseAnimationViewController ()

@property (nonatomic,strong) NSArray *operateTitleArray;

@end

@implementation BaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    
}

-(void) initData{
    _operateTitleArray = [self operateTitleArray];
}

-(void)initView{
    UIView *mView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 0)];
    mView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:mView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, Main_Screen_Width, 0)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [self controllerTitle];
    [mView addSubview:label];
    
    self.view.backgroundColor = [UIColor whiteColor];
    if (_operateTitleArray && _operateTitleArray.count>0) {
        NSUInteger row = _operateTitleArray.count%4 == 0 ? _operateTitleArray.count/4:_operateTitleArray.count/4+1;
        
        UIView *operateView = [[UIView alloc] initWithFrame:CGRectMake(0, Main_Screen_Height - (row*50 + 20 + 75), Main_Screen_Width, row*50+20)];
        
        [self.view addSubview:operateView];
        for (int i = 0 ; i<_operateTitleArray.count; i++) {
            TitleButton *btn = [[TitleButton alloc]initWithFrame:[self rectForbtnAtIndex:i totleNum:_operateTitleArray.count] withTitle:[_operateTitleArray objectAtIndex:i]];
            btn.tag = i;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [operateView addSubview:btn];
        }
    }
}

//获取button的frame
-(CGRect)rectForbtnAtIndex:(NSInteger) index totleNum:(NSInteger)Totle{
    // 每一行 4个
    NSUInteger maxColumnNum = 4;
    // 按钮 列 间距
    NSUInteger columnMargin = 20;
    // 按钮 行 间距
    NSUInteger rowMargin = 20;
    // 行 数
    
    //按钮 宽
    CGFloat width = (Main_Screen_Width - columnMargin *5)/4;
    //按钮 高
    CGFloat height = 30;
    
    //计算
    CGFloat offsetX = columnMargin + (index%maxColumnNum)*(width + columnMargin);
    CGFloat offsetY = rowMargin + (index/maxColumnNum)*(height + rowMargin);
    
    return CGRectMake(offsetX, offsetY, width, height);
    
}

-(NSString *)controllerTitle{
    return @"默认";
}

-(void)clickBtn:(UIButton *)btn{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
