//
//  UIDevice+Permission.h
//  linRunShengPi
//
//  Created by apple on 2018/3/5.
//  Copyright © 2018年 艾慧勇. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIDevicePermissionBlock) (BOOL isFirst, BOOL isHavePermission);

@interface UIDevice (Permission)

#pragma mark - 判断是否有硬件权限
+ (void)isHaveSysPermissionCameraBlock:(UIDevicePermissionBlock)permissionBlock;
+ (void)isHaveSysPermissionAudioBlock:(UIDevicePermissionBlock)permissionBlock;

// 相册: 获取,判断,提醒权限等问题.
+ (void)isHaveSysPowerForAlbumBlock:(UIDevicePermissionBlock)permissionBlock;
+ (void)isHaveSysPowerForAlbumAlert:(BOOL)isShowAlert block:(UIDevicePermissionBlock)permissionBlock;

// 相册: 判断.
+ (BOOL)isHavePowerForAlbum NS_DEPRECATED_IOS(2_0, 7_0, "Use -isHaveSysPowerForAlbumAlert:block:");


@end
