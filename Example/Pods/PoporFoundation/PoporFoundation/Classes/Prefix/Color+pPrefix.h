//
//  Block+pPrefix.h
//  PoporFoundation
//
//  Created by popor on 2017/7/5.
//  Copyright © 2017年 popor. All rights reserved.
//

#import "Os+pPrefix.h"

#import <CoreGraphics/CoreGraphics.h>

#ifndef Color_pPrefix_h
#define Color_pPrefix_h

// need:UIKit,CoreGraphics
CG_INLINE COLOR_CLASS * PRGBF(CGFloat R, CGFloat G, CGFloat B, CGFloat F) {
    return [COLOR_CLASS colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:F];
};

// need:UIKit,CoreGraphics
CG_INLINE COLOR_CLASS * PRGB16(unsigned long rgbValue) {
    return [COLOR_CLASS colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(rgbValue & 0xFF))/255.0 alpha:1.0];
};

CG_INLINE COLOR_CLASS * PRGB16F(unsigned long rgbValue, CGFloat F) {
    return [COLOR_CLASS colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(rgbValue & 0xFF))/255.0 alpha:F];
};

//------------------------------------------------------------------------------
// 常用的色
#define PColorBlack     [UIColor blackColor]

#define PColorBlack0    [UIColor blackColor]
#define PColorBlack1    PRGB16(0X111111)
#define PColorBlack2    PRGB16(0X222222)
#define PColorBlack3    PRGB16(0X333333)
#define PColorBlack4    PRGB16(0X444444)
#define PColorBlack5    PRGB16(0X555555)
#define PColorBlack6    PRGB16(0X666666)
#define PColorBlack7    PRGB16(0X777777)
#define PColorBlack8    PRGB16(0X888888)
#define PColorBlack9    PRGB16(0X999999)
#define PColorBlackA    PRGB16(0XAAAAAA)
#define PColorBlackB    PRGB16(0XBBBBBB)
#define PColorBlackC    PRGB16(0XCCCCCC)
#define PColorBlackD    PRGB16(0XDDDDDD)
#define PColorBlackE    PRGB16(0XEEEEEE)
#define PColorBlackF    PRGB16(0XFFFFFF)

#define PColorWhite     [UIColor whiteColor]
#define PColorClear     [UIColor clearColor]
#define PColorTVBG      PRGBF(240, 240, 240, 1)

#endif /* Block+pPrefix_h */
