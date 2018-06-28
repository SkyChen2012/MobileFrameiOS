//
//  LoginPresenterCompl.m
//  MobileFrame
//
//  Created by Benson on 2018/6/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LoginPresenterCompl.h"
#import "ILoginView.h"

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
    [_loginView onLoginResult:NO code:2];
}
- (void)setProgressBarVisiblity:(int) visiblity{
    
}



@end
