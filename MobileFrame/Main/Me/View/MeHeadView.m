//
//  MeHeadView.m
//  MobileFrame
//
//  Created by Benson on 2018/7/9.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "MeHeadView.h"
#import "UIImage+BetterFace.h"

@interface MeHeadView()

@end

@implementation MeHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
    
}

- (void)setupView{
    
    [self addSubview:self.HeadImageVew];
    [_HeadImageVew mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
}

- (UIImageView *)HeadImageView{
    if (!_HeadImageVew) {
        _HeadImageVew = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@""]betterFaceImageForSize:CGSizeMake(20.0, 20.0) accuracy:BFAccuracyHigh]];
        
    }
    return _HeadImageVew;
}


@end
