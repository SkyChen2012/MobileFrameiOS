//
//  MeHeadView.h
//  MobileFrame
//
//  Created by Benson on 2018/7/9.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMeHead.h"

@interface MeHeadView : UIView<IMeHead>

@property(nonatomic,strong) UIImageView *HeadImageVew;
@property(nonatomic,strong) UILabel *UserName;
@property(nonatomic,strong) UILabel *Signature;

@end
