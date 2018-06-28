//
//  ILoginPresenter.h
//  MobileFrame
//
//  Created by Benson on 2018/6/20.
//  Copyright © 2018年 Benson. All rights reserved.
//

@protocol ILoginPresenter <NSObject>

- (void)clear;
- (void)doLoginWithName:(NSString *)name Passwd:(NSString *) passwd;
- (void)setProgressBarVisiblity:(int) visiblity;

@end
