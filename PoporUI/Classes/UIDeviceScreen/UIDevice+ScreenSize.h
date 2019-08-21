//
//  UIDevice+ScreenSize.h
//  PoporUI
//
//  Created by popor on 2018/3/27.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark - iOS
#if TARGET_OS_IOS || TARGET_OS_WATCH

@interface UIDevice (ScreenSize)

// 是否是刘海屏幕,通过安全区域取值
+ (BOOL)isIphoneXScreen;

// 获取 系统statusBar Height
+ (int)statusBarHeight;

/** iphoneX 底部安全距离 */
+ (CGFloat)safeBottomMargin;

@end

#pragma mark - macOX
#elif TARGET_OS_MAC


#endif


