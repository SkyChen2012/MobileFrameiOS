//
//  LoginPresenterCompl.m
//  MobileFrame
//
//  Created by Benson on 2018/6/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LoginPresenterCompl.h"
#import "ILoginView.h"
#import "LogInApi.h"
#import "LoginModel.h"

@interface LoginPresenterCompl() 

@property (nonatomic,weak) id<ILoginView> loginView;

@end

@implementation LoginPresenterCompl

-(instancetype)initWithView:(id) loginView{
    
    self = [super init];
    if (self) {
        _loginView = loginView;
    }
    return self;
}


- (void)clear{
    [_loginView onClearText];
}
- (void)doLoginWithName:(NSString *)name Passwd:(NSString *) passwd{
    NSLog(@"name = %@ , Passwd = %@",name,passwd);
    
    //测试登录及网络请求
    LogInApi *reg = [[LogInApi alloc] initWithUsername:@"username" password:@"password"];
    [reg startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"状态码%ld",request.responseStatusCode);
        LoginModel *model=[[LoginModel alloc]initWithString:request.responseString error:nil];
        NSLog(@"响应内容:%@",model.access_token);
//        成功登录 跳转到首页
        [_loginView onLoginResult:YES code:2];
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"Error request = >%@",request);
        [_loginView onLoginResult:YES code:2];
    }];
    
}
- (void)setProgressBarVisiblity:(int) visiblity{
    
}



@end
