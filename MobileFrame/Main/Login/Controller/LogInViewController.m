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
    
    //登录成功后跳转到首页
    [((AppDelegate*) AppDelegateInstance) setupHomeViewController];
    
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
