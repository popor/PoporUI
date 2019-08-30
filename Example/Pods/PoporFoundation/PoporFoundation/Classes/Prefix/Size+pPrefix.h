//
//  Size+pPrefix.h
//  PoporFoundation
//
//  Created by popor on 2017/7/6.
//  Copyright © 2017年 popor. All rights reserved.
//

#ifndef Size_pPrefix_h
#define Size_pPrefix_h

#pragma mark - iOS
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
#import <UIKit/UIKit.h>

#define PSCREEN_BOUNDS   [[UIScreen mainScreen] bounds]
#define PSCREEN_SIZE     [[UIScreen mainScreen] bounds].size

#define PSCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define PSCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


#pragma mark - macOS
#elif TARGET_OS_MAC
#import <AppKit/AppKit.h>

#define PSCREEN_BOUNDS   [[NSScreen mainScreen] bounds]
#define PSCREEN_SIZE     [[NSScreen mainScreen] bounds].size

#define PSCREEN_WIDTH   [NSScreen mainScreen].bounds.size.width
#define PSCREEN_HEIGHT  [NSScreen mainScreen].bounds.size.height

#endif

#endif /* Size+pPrefix_h */
