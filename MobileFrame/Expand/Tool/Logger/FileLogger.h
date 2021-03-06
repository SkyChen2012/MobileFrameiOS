//
//  FileLogger.h
//  MobileFrame
//
//  Created by Benson on 2018/6/21.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack.h>
#import "LoggerFormatter.h"

@interface FileLogger : NSObject

@property (nonatomic, strong, readwrite) DDFileLogger *fileLogger;

+(FileLogger *)sharedManager;

@end
