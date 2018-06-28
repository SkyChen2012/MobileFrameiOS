//
//  TitleButton.m
//  MobileFrame
//
//  Created by Benson on 2018/6/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)Title{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:Title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

@end
