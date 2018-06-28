//
//  runTimeTest.h
//  MobileFrame
//
//  Created by Benson on 2018/6/26.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface runTimeTest : NSObject<NSCopying>
{
    NSString *_schoolName;
}

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *address;

+(void)showAddressInfo;

-(NSString *)showUserName:(NSString *)name;

@end
