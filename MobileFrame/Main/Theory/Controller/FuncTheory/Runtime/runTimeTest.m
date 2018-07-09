//
//  runTimeTest.m
//  MobileFrame
//
//  Created by Benson on 2018/6/26.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "runTimeTest.h"

@interface runTimeTest()
{
    int _UserAge;
}

@end

@implementation runTimeTest


+ (void)showAddressInfo{
    DDLogInfo(@"当前地址为杭州");
}

-(NSString *)showUserName:(NSString *)name{
    
    return [NSString stringWithFormat:@"user name is %@",name];
}


//NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{

}

- (id)initWithCoder:(NSCoder *)decoder
{   
    return 0;
}

@end
