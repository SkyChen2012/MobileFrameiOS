//
//  LogInApi.h
//  MobileFrame
//
//  Created by Benson on 2018/3/21.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInApi : BaseRequestService

- (id)initWithUsername:(NSString *)username password:(NSString *)password;

@end
