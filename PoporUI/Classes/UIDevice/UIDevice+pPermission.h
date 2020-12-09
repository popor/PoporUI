//
//  UIDevice+pPermission.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * AlertSysPermissionAlbum__  = @"请在iPhone的“设置-隐私-照片”选项中，允许__访问您的照片。";
static NSString * AlertSysPermissionCamera__ = @"请在iPhone的“设置-隐私-相机”选项中，允许__访问您的相机。";
static NSString * AlertSysPermissionAudio__  = @"请在iPhone的“设置-隐私-麦克风”选项中，允许__访问您的麦克风。";
static NSString * AlertSysPermissionGps__    = @"请在iPhone的“设置-隐私-定位服务”选项中，允许__访问您的定位服务。";

typedef void(^UIDevicePermissionBlock) (BOOL isFirst, BOOL isHavePermission);

@interface UIDevice (pPermission)

#pragma mark - 判断是否有硬件权限
+ (void)isHaveSysPermissionCameraBlock:(UIDevicePermissionBlock)permissionBlock;
+ (void)isHaveSysPermissionAudioBlock:(UIDevicePermissionBlock)permissionBlock;

// 相册: 获取,判断,提醒权限等问题.
+ (void)isHaveSysPowerForAlbumBlock:(UIDevicePermissionBlock)permissionBlock;
+ (void)isHaveSysPowerForAlbumAlert:(BOOL)isShowAlert block:(UIDevicePermissionBlock)permissionBlock;

// 相册: 判断.
+ (BOOL)isHavePowerForAlbum NS_DEPRECATED_IOS(2_0, 7_0, "Use -isHaveSysPowerForAlbumAlert:block:");

/**
 作者：点火柴的小男孩
 链接：https://www.jianshu.com/p/06a77b00739f
 来源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
// 推送权限
+ (void)isHaveApnsBlock:(UIDevicePermissionBlock)permissionBlock;

/** 打开对应的警告框
 [UIDevice showAV_OpenSettingsURLWithMessage:[UIDevice alertTitleWithOriginText:AlertSysPermissionGps__]];
 */
+ (void)showAV_OpenSettingsURLWithMessage:(NSString *)message;
+ (NSString *)alertTitleWithOriginText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
