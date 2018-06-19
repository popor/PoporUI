//
//  UIDevice+Tool.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(int, NetStatusType)
{
    NetStatusType_nil,
    NetStatusType_2G,
    NetStatusType_3G,
    NetStatusType_4G,
    NetStatusType_Wifi,
};

@interface UIDevice (Tool)

#pragma mark [获取设备 Retina 信息]
+ (BOOL)isRetinaScreen;

#pragma mark - 检测推送开关是否打开
+ (BOOL)pushNotificationsEnabled;

//#pragma mark - 获得渐变颜色
//+ (UIImage*)imageFromColors:(NSArray*)colors frame:(CGRect)frame;

/**
 * 获取ios设备状态栏网络状态，检测2G、3G、4G、wifi都是正常的。
 */
+ (NSString *)getIOSStatusBarNetWorkTypeStr;
+ (int)getIOSStatusBarNetWorkTypeInt;

+ (NSString *)getAppName;

#pragma mark - APP Plist 版本
/**
 *  对外版本号
 */
+ (NSString *)getAppVersion_short;

/**
 *  对内build号
 */
+ (NSString *)getAppVersion_build;

+ (NSString*)devicePlatform;
+ (BOOL)isIPhone6SOrNewer;
+ (BOOL)isIPhone5S;

+ (NSString *)getWifiName;

@end
