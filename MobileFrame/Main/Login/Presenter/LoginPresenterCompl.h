//
//  LoginPresenterCompl.h
//  MobileFrame
//
//  Created by Benson on 2018/6/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILoginPresenter.h"

@interface LoginPresenterCompl : NSObject <ILoginPresenter>

-(instancetype)initWithView:(id) loginView;

@end
