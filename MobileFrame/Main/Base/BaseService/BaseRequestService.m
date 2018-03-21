//
//  BaseRequestService.m
//  MobileFrame
//
//  Created by Benson on 2018/3/21.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@implementation BaseRequestService

//公共头部设置
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSDictionary *headerDictionary=@{@"platform":@"ios"};
    return headerDictionary;
}

@end
