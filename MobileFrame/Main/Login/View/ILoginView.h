//
//  ILoginView.h
//  MobileFrame
//
//  Created by Benson on 2018/6/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

@protocol ILoginView <NSObject>

- (void)onClearText;
- (void)onLoginResult:(Boolean) result code:(int) code;
- (void)onSetProgressBarVisibility:(int) visibility;

@end

