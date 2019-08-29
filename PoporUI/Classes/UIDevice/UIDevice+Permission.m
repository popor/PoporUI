//
//  UIDevice+Permission.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIDevice+Permission.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

#import "UIDevice+Tool.h"
#import <PoporFoundation/NSString+Tool.h>

static NSString * AlertSysPermissionAlbum__  = @"请在iPhone的“设置-隐私-照片”选项中，允许__访问您的照片。";
static NSString * AlertSysPermissionCamera__ = @"请在iPhone的“设置-隐私-相机”选项中，允许__访问您的相机。";
static NSString * AlertSysPermissionAudio__  = @"请在iPhone的“设置-隐私-麦克风”选项中，允许__访问您的麦克风。";

@implementation UIDevice (Permission)

+ (void)isHaveSysPermissionCameraBlock:(UIDevicePermissionBlock)permissionBlock
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    BOOL isFirst = status==AVAuthorizationStatusNotDetermined ? YES : NO;
    
    switch (status) {
        case AVAuthorizationStatusNotDetermined:{
            // 许可对话没有出现，发起授权许可
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    permissionBlock(isFirst, granted);
                });
            }];
            break;
        }
        case AVAuthorizationStatusDenied:
        case AVAuthorizationStatusRestricted:{
            // 用户明确地拒绝授权，或者相机设备无法访问
            permissionBlock(isFirst, NO);
            [self showAV_OpenSettingsURLWithMessage:[UIDevice alertTitleWithOriginText:AlertSysPermissionCamera__]];
            break;
        }
        case AVAuthorizationStatusAuthorized:{
            // 已经开启授权，可继续
            permissionBlock(isFirst, YES);
            break;
        }
        default:
            break;
    }
}

+ (void)isHaveSysPermissionAudioBlock:(UIDevicePermissionBlock)permissionBlock
{
    AVAudioSessionRecordPermission permission = [[AVAudioSession sharedInstance] recordPermission];
    BOOL isFirst = permission==AVAudioSessionRecordPermissionUndetermined ? YES : NO;
    
    switch (permission) {
        case AVAudioSessionRecordPermissionUndetermined:{
            [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    permissionBlock(isFirst, granted);
                });
            }];
            break;
        }
        case AVAudioSessionRecordPermissionDenied:{
            permissionBlock(isFirst, NO);
            [self showAV_OpenSettingsURLWithMessage:[UIDevice alertTitleWithOriginText:AlertSysPermissionAudio__]];
            break;
        }
        case AVAudioSessionRecordPermissionGranted:{
            permissionBlock(isFirst, YES);
            break;
        }
        default:
            break;
    }
    
}

// 相册: 获取,判断,提醒权限等问题.
+ (void)isHaveSysPowerForAlbumBlock:(UIDevicePermissionBlock)permissionBlock {
    [UIDevice isHaveSysPowerForAlbumAlert:YES block:permissionBlock];
}

+ (void)isHaveSysPowerForAlbumAlert:(BOOL)isShowAlert block:(UIDevicePermissionBlock)permissionBlock {
    // 以后只负责IOS8系统
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    BOOL isFirst = status==PHAuthorizationStatusNotDetermined ? YES : NO;
    
    switch (status) {
        case PHAuthorizationStatusNotDetermined:{
            // 触发获取照片权限,
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (status == PHAuthorizationStatusAuthorized) {
                        permissionBlock(isFirst, YES);
                    }else{
                        permissionBlock(isFirst, NO);
                    }
                });
            }];
            break;
        }
        case PHAuthorizationStatusRestricted:
        case PHAuthorizationStatusDenied:{
            permissionBlock(isFirst, NO);
            if (isShowAlert) {
                [self showAV_OpenSettingsURLWithMessage:[UIDevice alertTitleWithOriginText:AlertSysPermissionAlbum__]];
            }
            break;
        }
        case PHAuthorizationStatusAuthorized:{
            permissionBlock(isFirst, YES);
            break;
        }
        default:
            break;
    }
}

+ (void)showAV_OpenSettingsURLWithMessage:(NSString *)message {    
    UIAlertController * oneAC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }];
    
    [oneAC addAction:cancleAction];
    [oneAC addAction:okAction];
    
    UIWindow * window = [UIApplication sharedApplication].windows.firstObject;
    [window.rootViewController presentViewController:oneAC animated:YES completion:nil];
}

// 相册: 判断.
+ (BOOL)isHavePowerForAlbum {
    return [PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized;
}

+ (NSString *)alertTitleWithOriginText:(NSString *)text {
    return [text replaceWithREG:@"__" newString:[UIDevice getAppName]];
}


@end
