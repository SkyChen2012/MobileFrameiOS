//
//  LogInApi.m
//  MobileFrame
//
//  Created by Benson on 2018/3/21.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LogInApi.h"

@interface LogInApi()
{
    NSString *_username;
    NSString *_password;
}
@end

@implementation LogInApi

- (id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"user/login";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

-(SERVERCENTER_TYPE)centerType
{
    return ACCOUNT_SERVERCENTER;
}

- (id)requestArgument {
    return @{
             @"user_name": _username,
             @"user_password": _password
             };
}

@end
