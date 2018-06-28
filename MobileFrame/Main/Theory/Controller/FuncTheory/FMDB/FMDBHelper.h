//
//  FMDBHelper.h
//  MobileFrame
//
//  Created by Benson on 2018/6/28.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

@interface FMDBHelper : NSObject

+ (instancetype)sharedFMDBHelper;

#pragma mark - Person

/**
 *  添加person
 */
- (void)addPerson:(Person *)person;
/**
 *  删除person
 */
- (void)deletePerson:(Person *)person;
/**
 *  更新person
 */
- (void)updatePerson:(Person *)person;
/**
 *  获取所有数据
 */
- (NSMutableArray *)getAllPerson;

#pragma mark - Car

/**
 *  给person添加车辆
 */
- (void)addCar:(Car *)car toPerson:(Person *)person;
/**
 *  给person删除车辆
 */
- (void)deleteCar:(Car *)car fromPerson:(Person *)person;
/**
 *  获取person的所有车辆
 */
- (NSMutableArray *)getAllCarsFromPerson:(Person *)person;
/**
 *  删除person的所有车辆
 */
- (void)deleteAllCarsFromPerson:(Person *)person;


@end
