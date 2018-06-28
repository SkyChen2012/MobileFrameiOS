//
//  Car.h
//  MobileFrame
//
//  Created by Benson on 2018/6/28.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

/**
 *  所有者
 */
@property(nonatomic,strong ) NSNumber *own_id;
/**
 *  车的ID
 */
@property(nonatomic,strong) NSNumber *car_id;
@property(nonatomic,copy) NSString *brand;
@property(nonatomic,assign) NSInteger price;

@end
