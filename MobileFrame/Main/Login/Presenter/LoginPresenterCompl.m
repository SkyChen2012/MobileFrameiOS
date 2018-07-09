//
//  LoginPresenterCompl.m
//  MobileFrame
//
//  Created by Benson on 2018/6/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LoginPresenterCompl.h"

#import "AppDelegate.h"

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
    DDLogInfo(@"name = %@ , Passwd = %@",name,passwd);
    
    //测试日志
    DDLogError(@"测试 Error 信息");
    DDLogWarn(@"测试 Warn 信息");
    DDLogDebug(@"测试 Debug 信息");
    DDLogInfo(@"测试 Info 信息");
    DDLogVerbose(@"测试 Verbose 信息");
    
    //测试登录及网络请求
    LogInApi *reg = [[LogInApi alloc] initWithUsername:@"username" password:@"password"];
    [reg startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        DDLogInfo(@"状态码%ld",request.responseStatusCode);
        LoginModel *model=[[LoginModel alloc]initWithString:request.responseString error:nil];
        DDLogInfo(@"响应内容:%@",model.access_token);
//        成功登录 跳转到首页
        [_loginView onLoginResult:YES code:2];
    } failure:^(YTKBaseRequest *request) {
        DDLogInfo(@"Error request = >%@",request);
        [_loginView onLoginResult:YES code:2];
    }];
    
}
- (void)setProgressBarVisiblity:(int) visiblity{
    
}



@end
