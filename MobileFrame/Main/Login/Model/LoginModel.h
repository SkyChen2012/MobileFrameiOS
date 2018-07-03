//
//  LoginModel.h
//  MobileFrame
//
//  Created by Benson on 2018/7/3.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "JSONModel.h"

@interface LoginModel : JSONModel

@property(nonatomic,copy)NSString<Optional> *access_token;

@end
