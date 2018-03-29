//
//  LogInViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/21.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LogInViewController.h"
#import "AppDelegate.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setupViews];
    
    
    //登录成功后跳转到首页
//    [((AppDelegate*) AppDelegateInstance) setupHomeViewController];
    
    //测试登录及网络请求
//    LogInApi *reg = [[LogInApi alloc] initWithUsername:@"username" password:@"password"];
//    [reg startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//        NSLog(@"状态码%ld",request.responseStatusCode);
//        LoginModel *model=[[LoginModel alloc]initWithString:request.responseString error:nil];
//        NSLog(@"响应内容:%@",model.access_token);
//        //成功登录 跳转到首页
//        [((AppDelegate*)AppDelegateInstance) setupHomeViewController];
//        
//    } failure:^(YTKBaseRequest *request) {
//        NSLog(@"Error");
//    }];
    
}

- (void)setupViews{
    
    UITextField *accountTextField = [[UITextField alloc] init];  
    accountTextField.backgroundColor = [UIColor redColor];  
    accountTextField.placeholder = @"账号";  
    [self.view addSubview:accountTextField];  
    
    UITextField *secretTextField = [[UITextField alloc] init];  
    secretTextField.backgroundColor = [UIColor greenColor];  
    secretTextField.placeholder = @"密码"; 
    [self.view addSubview:secretTextField];
    
    UIButton *loginButton = [[UIButton alloc] init];  
    loginButton.backgroundColor = [UIColor blueColor];  
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];  
    [self.view addSubview:loginButton];
    
    [accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.left.equalTo(self.view.mas_left).offset(50);  
        make.right.equalTo(self.view.mas_right).offset(-50);  
        make.top.equalTo(self.view.mas_top).offset(150);  
        make.height.mas_equalTo(50);  
    }];
    
    [secretTextField mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.left.equalTo(self.view.mas_left).offset(50);
        make.right.equalTo(self.view.mas_right).offset(-50);  
        make.top.equalTo(accountTextField.mas_bottom).offset(40);  
        make.height.mas_equalTo(50);  
    }];
    
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.left.equalTo(self.view.mas_left).offset(100);  
        make.right.equalTo(self.view.mas_right).offset(-100);  
        make.top.equalTo(secretTextField.mas_bottom).offset(40);  
        make.height.mas_equalTo(50);  
    }];  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
