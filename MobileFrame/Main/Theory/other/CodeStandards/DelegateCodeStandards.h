//
//  DelegateCodeStandards.h
//  MobileFrame
//
//  Created by Benson on 2018/3/22.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DelegateCodeStandards;

@protocol CodeStandardsDelegate <NSObject>

@required
-(void)networkFetcher:(DelegateCodeStandards *)codestandards didReceiveName:(NSString *)name;

-(NSString *)selectIndexFetcher:(DelegateCodeStandards *)codestandards withIndex:(NSInteger)index;

@optional
-(void)networkFetcher:(DelegateCodeStandards *)codestandards didFaileWithError:(NSError *)error;

@end

@interface DelegateCodeStandards : NSObject

@property(nonatomic,weak)id <CodeStandardsDelegate> delegate;

@property(nonatomic,copy,readonly)NSString *userName;

-(instancetype)initWithUserName:(NSString *)userName;

-(NSString *)changeUserName:(NSInteger)index;

-(void)getUserAddressWithName:(NSString *)name;

@end
