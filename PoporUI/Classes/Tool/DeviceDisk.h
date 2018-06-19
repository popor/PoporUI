//
//  DeviceDisk.h
//  WanziTG
//
//  Created by 王凯庆 on 2017/1/9.
//  Copyright © 2017年 wanzi. All rights reserved.
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
