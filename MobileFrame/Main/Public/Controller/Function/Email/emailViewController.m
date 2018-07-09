//
//  emailViewController.m
//  MobileFrame
//
//  Created by Benson on 2018/7/6.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "emailViewController.h"
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"

@interface emailViewController ()<SKPSMTPMessageDelegate>

@property(nonatomic,strong) UIButton *sendEmail;

@end

@implementation emailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.sendEmail];
    [_sendEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50);  
        make.right.equalTo(self.view.mas_right).offset(-50);  
        make.top.equalTo(self.view.mas_top).offset(150);  
        make.height.mas_equalTo(50);  
    }];
    
}

- (UIButton *)sendEmail{
    if (!_sendEmail) {
        _sendEmail = [[UIButton alloc] init];
        _sendEmail.titleLabel.text = @"Email";
        _sendEmail.backgroundColor = [UIColor RandomColor];
        [_sendEmail addTarget:self action:@selector(sendEmailMessage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendEmail;
}

- (void)sendEmailMessage:(UIButton* )btn{
    //设置基本参数：
    SKPSMTPMessage *mail = [[SKPSMTPMessage alloc] init];
    [mail setSubject:@"设置邮件主题"]; // 设置邮件主题
    [mail setToEmail:@"11247@hongyan.com.cn"]; // 目标邮箱
    [mail setFromEmail:@"11247@hongyan.com.cn"]; // 发送者邮箱
    [mail setRelayHost:@"smtp.exmail.qq.com"]; // 发送邮件代理服务器
    [mail setRequiresAuth:YES];
    [mail setLogin:@"11247@hongyan.com.cn"]; // 发送者邮箱账号
    [mail setPass:@"chenbin"]; // 发送者邮箱密码
    [mail setWantsSecure:YES]; // 需要加密
    [mail setDelegate:self];
    //设置邮件正文内容：
    NSString *content = [NSString stringWithCString:"测试内容" encoding:NSUTF8StringEncoding];
    NSDictionary *plainPart = @{kSKPSMTPPartContentTypeKey : @"text/plain; charset=UTF-8", kSKPSMTPPartMessageKey : content, kSKPSMTPPartContentTransferEncodingKey : @"8bit"};
    //添加附件（以下代码可在SKPSMTPMessage库的DMEO里找到）：
    NSString *vcfPath = [[NSBundle mainBundle] pathForResource:@"EmptyPDF" ofType:@"pdf"];
    NSData *vcfData = [NSData dataWithContentsOfFile:vcfPath];
    NSDictionary *vcfPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/directory;\r\n\tx-unix-mode=0644;\r\n\tname=\"EmptyPDF.pdf\"",kSKPSMTPPartContentTypeKey, @"attachment;\r\n\tfilename=\"EmptyPDF.pdf\"",kSKPSMTPPartContentDispositionKey,[vcfData encodeBase64ForData],kSKPSMTPPartMessageKey,@"base64",kSKPSMTPPartContentTransferEncodingKey,nil];
    //执行发送邮件代码
    [mail setParts:@[plainPart, vcfPart]]; // 邮件首部字段、邮件内容格式和传输编码
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [mail send];
    });
} 


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//SKPSMTPMessage代理，可以获知成功/失败进行后续步骤处理
-(void)messageSent:(SKPSMTPMessage *)message{       
    NSLog(@"%@", message);
}
-(void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error{ 
    NSLog(@"message - %@\nerror - %@", message, error);
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
