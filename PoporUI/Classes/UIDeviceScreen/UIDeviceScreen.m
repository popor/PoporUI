//
//  UIDeviceScreen.m
//  linRunShengPi
//
//  Created by popor on 2018/3/27.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIDeviceScreen.h"

#pragma mark - iOS
#if TARGET_OS_IOS || TARGET_OS_WATCH
@implementation UIDeviceScreen

+ (CGFloat)safeTopMargin:(UINavigationController *)nc {
    CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];//标题栏
    CGRect NavRect    = nc.navigationBar.frame;//然后将高度相加，便可以动态计算顶部高度。
    CGFloat height    = StatusRect.size.height + NavRect.size.height;
    
    return height;
}

+ (CGFloat)safeBottomMargin {
    CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];//标题栏
    if (StatusRect.size.height == 0 || StatusRect.size.height == 20) {
        return 0;
    }else{
        return 34;
    }
}

@end

#pragma mark - macOX
#elif TARGET_OS_MAC


#endif


