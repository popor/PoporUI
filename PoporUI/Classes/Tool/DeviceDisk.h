//
//  DeviceDisk.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceDisk : NSObject

#pragma mark [获取设备版本号]
+ (NSString *)getDeviceNormalPlatform;

/**
 * 获取当前可用内存
 */
+(long long)getAvailableMemorySize;

#pragma mark 【获取人性化容量】
+ (NSString *)getHumanSize:(float)fileSizeFloat;

@end
