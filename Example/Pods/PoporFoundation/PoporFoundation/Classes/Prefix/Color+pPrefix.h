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
CG_INLINE COLOR_CLASS * PRGBF(float R, float G, float B, float F) {
    return [COLOR_CLASS colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:F];
};

// need:UIKit,CoreGraphics
CG_INLINE COLOR_CLASS * PRGB16(unsigned long rgbValue) {
    return [COLOR_CLASS colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
};

CG_INLINE COLOR_CLASS * PRGB16F(unsigned long rgbValue, float F) {
    return [COLOR_CLASS colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:F];
};

//------------------------------------------------------------------------------
// 常用的色
#define PColorBlack     [UIColor blackColor]
#define PColorBlackC    PRGB16(0XCCCCCC)
#define PColorBlackE    PRGB16(0XEEEEEE)
#define PColorBlack0    [UIColor blackColor]
#define PColorBlack3    PRGB16(0X333333)
#define PColorBlack6    PRGB16(0X666666)
#define PColorBlack9    PRGB16(0X999999)
#define PColorWhite     [UIColor whiteColor]
#define PColorClear     [UIColor clearColor]
#define PColorTVBG      PRGBF(240, 240, 240, 1)

#endif /* Block+pPrefix_h */
