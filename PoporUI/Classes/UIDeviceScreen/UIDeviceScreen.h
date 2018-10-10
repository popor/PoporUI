//
//  UIDeviceScreen.h
//  linRunShengPi
//
//  Created by popor on 2018/3/27.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark - iOS
#if TARGET_OS_IOS || TARGET_OS_WATCH

@interface UIDeviceScreen : NSObject

/** 导航栏的高度，包含状态栏 */
+ (CGFloat)safeTopMargin:(UINavigationController *)nc;

/** iphoneX 底部安全距离 */
+ (CGFloat)safeBottomMargin;

@end

#pragma mark - macOX
#elif TARGET_OS_MAC


#endif


