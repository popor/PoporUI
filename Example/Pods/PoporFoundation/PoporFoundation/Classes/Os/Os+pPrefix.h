//
//  Size+pPrefix.h
//  PoporFoundation
//
//  Created by popor on 2017/7/6.
//  Copyright © 2017年 popor. All rights reserved.
//

#ifndef Os_pPrefix_h
#define Os_pPrefix_h

// UI系列
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
#import <UIKit/UIKit.h>

#define VIEW_CLASS  UIView
#define VC_CLASS    UIViewController
#define BT_CLASS    UIButton
#define IV_CLASS    UIImageView

#define FONT_CLASS  UIFont
#define COLOR_CLASS UIColor
#define IMAGE_CLASS UIImage

// NS系列
#elif TARGET_OS_MAC
#import <AppKit/AppKit.h>

#define VIEW_CLASS  NSView
#define VC_CLASS    NSViewController
#define BT_CLASS    NSButton
#define IV_CLASS    NSImageView

#define FONT_CLASS  NSFont
#define COLOR_CLASS NSColor
#define IMAGE_CLASS NSImage

#endif




#endif /* Os+pPrefix_h */
