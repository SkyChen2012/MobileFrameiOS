//
//  HomeViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/21.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "HomeViewController.h"

#import <React/RCTRootView.h>

#import "UIColor+Gradient.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self SetupView];
}

- (void)SetupView{
    
 
    UIButton *loginButton = [[UIButton alloc] init];  
//    loginButton.backgroundColor = [UIColor gradientFromColor:[UIColor blueColor] toColor:[UIColor redColor] withHeight:50];
    loginButton.backgroundColor = [UIColor RandomColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.left.equalTo(self.view.mas_left).offset(100);  
        make.right.equalTo(self.view.mas_right).offset(-100);  
        make.top.mas_equalTo(140);  
        make.height.mas_equalTo(50);  
    }];  
}

- (void)buttonClick:(UIButton *)button{
    
    DDLogInfo(@"High Score Button Pressed");
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.1.108:8081/index.ios.bundle?platform=ios"];
    RCTRootView *rootView =[[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                                                moduleName        : @"MyReactNativeApp"
                                                initialProperties : @{
                                                                       @"scores" : @[
                                                                               @{
                                                                                   @"name" : @"Alex",
                                                                                   @"value": @"42"
                                                                                   },
                                                                               @{
                                                                                   @"name" : @"Joel",
                                                                                   @"value": @"10"
                                                                                   },
                                                                               @{
                                                                                   @"name" : @"Benson",
                                                                                   @"value": @"999"
                                                                                   }
                                                                               ]
                                                                    }
                                                 launchOptions    : nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
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
