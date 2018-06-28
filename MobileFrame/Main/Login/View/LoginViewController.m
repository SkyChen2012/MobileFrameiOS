//
//  LogInViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/3/21.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

#import "ILoginPresenter.h"
#import "LoginPresenterCompl.h"

@interface LoginViewController ()

@property(nonatomic,strong)UITextField *accountTextField;
@property(nonatomic,strong)UITextField *secretTextField;
@property(nonatomic,strong)UIButton *loginButton;
@property(nonatomic,strong)UIButton *clearButton;

@property (nonatomic,strong) id<ILoginPresenter> LoginPresenter;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _LoginPresenter = [[LoginPresenterCompl alloc] initWithView:self];
    
    [self setupViews];
    
    
    //登录成功后跳转到首页
//    
    
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
    
    _accountTextField = [[UITextField alloc] init];  
    _accountTextField.backgroundColor = [UIColor RandomColor];  
    _accountTextField.placeholder = @"账号";  
    [self.view addSubview:_accountTextField];  
    
    _secretTextField = [[UITextField alloc] init];  
    _secretTextField.backgroundColor = [UIColor RandomColor];  
    _secretTextField.placeholder = @"密码"; 
    [self.view addSubview:_secretTextField];
    
    _loginButton = [[UIButton alloc] init];  
    _loginButton.backgroundColor = [UIColor RandomColor];  
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    _loginButton.tag = 1;
    [_loginButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    _clearButton = [[UIButton alloc] init];
    _clearButton.backgroundColor = [UIColor RandomColor];
    [_clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    _clearButton.tag = 2;
    [_clearButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_clearButton];
    
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.left.equalTo(self.view.mas_left).offset(50);  
        make.right.equalTo(self.view.mas_right).offset(-50);  
        make.top.equalTo(self.view.mas_top).offset(150);  
        make.height.mas_equalTo(50);  
    }];
    
    [_secretTextField mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.left.equalTo(self.view.mas_left).offset(50);
        make.right.equalTo(self.view.mas_right).offset(-50);  
        make.top.equalTo(_accountTextField.mas_bottom).offset(40);  
        make.height.mas_equalTo(50);  
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {  
        make.left.equalTo(self.view.mas_left).offset(50);  
        make.width.mas_equalTo(100);
        make.top.equalTo(_secretTextField.mas_bottom).offset(40);  
        make.height.mas_equalTo(40);  
    }];
    
    [_clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.width.mas_equalTo(100);
        make.top.equalTo(_secretTextField.mas_bottom).offset(40);  
        make.height.mas_equalTo(40);  
    }];
}

-(void) onClick:(UIButton *) btn{
    switch (btn.tag) {
        case 1:
            NSLog(@"login");
            _accountTextField.enabled = NO;
            _secretTextField.enabled = NO;
            [_LoginPresenter doLoginWithName:_accountTextField.text Passwd:_secretTextField.text];
            break;
        case 2:
            NSLog(@"clear");
            _accountTextField.enabled = YES;
            _secretTextField.enabled = YES;
            [_LoginPresenter clear];
            break;
        default:
            break;
    }
}

- (void)onClearText{
    _accountTextField.text = @"";
    _secretTextField.text = @"";
}
- (void)onLoginResult:(Boolean) result code:(int) code{
    
    NSLog(@"onLoginResult  result = %d,code = %d",result,code);
    
    if (result == YES) {
        [((AppDelegate*) AppDelegateInstance) setupHomeViewController];
    }
    
    
}
- (void)onSetProgressBarVisibility:(int) visibility{
    NSLog(@"onSetProgressBarVisibility");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
