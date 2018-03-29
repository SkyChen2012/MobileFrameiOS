//
//  DelegateCodeStandards.m
//  MobileFrame
//
//  Created by Benson on 2018/3/22.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "DelegateCodeStandards.h"

@interface DelegateCodeStandards()
@property(nonatomic,copy,readwrite)NSString *userName;
@end

@implementation DelegateCodeStandards

-(instancetype)init
{
    return [self initWithUserName:@""];
}

-(instancetype)initWithUserName:(NSString *)userName
{
    if (self=[super init]) {
        _userName=[userName copy];
    }
    return self;
}

-(NSString *)changeUserName:(NSInteger)index
{
    NSString *curName=nil;
    if ([_delegate respondsToSelector:@selector(selectIndexFetcher:withIndex:)]) {
        curName=[_delegate selectIndexFetcher:self withIndex:index];
    }
    return curName;
}

-(void)getUserAddressWithName:(NSString *)name
{
    if ([_delegate respondsToSelector:@selector(networkFetcher:didReceiveName:)]) {
        [_delegate networkFetcher:self didReceiveName:name];
    }
}

@end
