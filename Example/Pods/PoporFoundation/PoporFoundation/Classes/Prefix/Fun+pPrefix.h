//
//  Fun+pPrefix.h
//  PoporFoundation
//
//  Created by popor on 2018/2/1.
//  Copyright © 2018年 popor. All rights reserved.
//

#ifndef Fun_pPrefix_h
#define Fun_pPrefix_h

#pragma mark - 异步执行
#ifndef dispatch_main_async_safe_sd
#define dispatch_main_async_safe_sd(block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif

#pragma mark - 标记开发状态
#ifndef __OPTIMIZE__
#define PIsDebugVersion                     YES
#else
#define PIsDebugVersion                     NO
#endif

#pragma mark - 特殊输入日志
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)

#define NSLogSuccess(FORMAT, ...) NSLog(@"%s: %s", [@"✅" UTF8String], [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#define NSLogError(FORMAT, ...)   NSLog(@"%s: %s", [@"❌" UTF8String], [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#define NSLogWarm(FORMAT, ...)    NSLog(@"%s: %s", [@"⚠️" UTF8String], [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

// fprintf 和 printf 参数不一致
#define NSPrintInfo(FORMAT, ...) fprintf(stderr,"\n函数:%s 行:%d 内容:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#define NSLogInfo(FORMAT, ...)   NSLog(@"函数:%s 行:%d 内容:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])


//#define NSLogInfo1(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#define NSLogInfo2(FORMAT, ...) printf("\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#define NSLog2(format, ...) printf("func:%s:\n%s\n---------------------\n\n", __PRETTY_FUNCTION__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);

// fun 0
#define NSLogRect(rect)         NSLog(@"‼️ CGRect : %s = %@"   , #rect,   NSStringFromCGRect(rect));
#define NSLogSize(size)         NSLog(@"‼️ CGSize : %s = %@"   , #size,   NSStringFromCGSize(size));
#define NSLogPoint(point)       NSLog(@"‼️ CGPoint : %s = %@"  , #point,  NSStringFromCGPoint(point));
#define NSLogRange(range)       NSLog(@"‼️ NSRange : %s = %@"  , #range,  NSStringFromRange(range));
#define NSLogInset(inset)       NSLog(@"‼️ Inset : %s = %@"    , #inset,  NSStringFromUIEdgeInsets(inset));

#define NSLogString(string)     NSLog(@"‼️ String : %s = %@"   , #string, string);
#define NSLogFloat(value)       NSLog(@"‼️ Float : %s = %f"    , #value,  value);
#define NSLogInt(value)         NSLog(@"‼️ Int : %s = %i"      , #value,  value);
#define NSLogInteger(value)     NSLog(@"‼️ Integer : %s = %li" , #value,  value);

// fun 1
#define NSLogRectTitle(rect, title)         NSLog(@"‼️ CGRect  %@ : %s = %@"   , title, #rect,   NSStringFromCGRect(rect));
#define NSLogSizeTitle(size, title)         NSLog(@"‼️ CGSize  %@ : %s = %@"   , title, #size,   NSStringFromCGSize(size));
#define NSLogPointTitle(point, title)       NSLog(@"‼️ CGPoint %@ : %s = %@"   , title, #point,  NSStringFromCGPoint(point));
#define NSLogRangeTitle(range, title)       NSLog(@"‼️ NSRange %@ : %s = %@"   , title, #range,  NSStringFromRange(range));
#define NSLogInsetTitle(inset, title)       NSLog(@"‼️ Inset %@ : %s = %@"     , title, #inset,  NSStringFromUIEdgeInsets(inset));

#define NSLogStringTitle(string, title)     NSLog(@"‼️ String  %@ : %s = %@"   , title, #string, string);
#define NSLogFloatTitle(value, title)       NSLog(@"‼️ Float   %@ : %s = %f"   , title, #value,  value);
#define NSLogIntTitle(value, title)         NSLog(@"‼️ Int     %@ : %s = %i"   , title, #value,  value);
#define NSLogIntegerTitle(value, title)     NSLog(@"‼️ Integer %@ : %s = %li"  , title, #value,  value);


#else

#define NSLog(...) {}

#define NSLogSuccess(FORMAT, ...) {}
#define NSLogError(FORMAT, ...) {}
#define NSLogWarm(FORMAT, ...) {}

#define NSPrintInfo(FORMAT, ...) {}
#define NSLogInfo(FORMAT, ...) ()

// fun 0
#define NSLogRect(rect)     {}
#define NSLogSize(size)     {}
#define NSLogPoint(point)   {}
#define NSLogRange(range)   {}
#define NSLogInset(inset)   {}

#define NSLogString(string) {}
#define NSLogFloat(value)   {}
#define NSLogInt(value)     {}
#define NSLogInteger(value) {}

// fun 1
#define NSLogRectTitle(rect, title)         {}
#define NSLogSizeTitle(size, title)         {}
#define NSLogPointTitle(point, title)       {}
#define NSLogRangeTitle(range, title)       {}
#define NSLogInsetTitle(inset, title)       {}

#define NSLogStringTitle(string, title)     {}
#define NSLogFloatTitle(value, title)       {}
#define NSLogIntTitle(value, title)         {}
#define NSLogIntegerTitle(value, title)     {}

#endif

#pragma mark - NSValue
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
#import <UIKit/UIKit.h>

#define NSValuePoint(point)         [NSValue valueWithCGPoint:point]
#define NSValueVector(vector)       [NSValue valueWithCGVector:vector]
#define NSValueSize(size)           [NSValue valueWithCGSize:size]
#define NSValueRect(rect)           [NSValue valueWithCGRect:rect]
#define NSValueTransform(transform) [NSValue valueWithCGAffineTransform:transform]
#define NSValueInsets(insets)       [NSValue valueWithUIEdgeInsets:insets]
#define NSValueOffset(insets)       [NSValue valueWithUIOffset:insets]

#elif TARGET_OS_MAC
#import <AppKit/AppKit.h>

#endif

// --- 其他小函数 ----------------------------------------------------------------
#pragma mark - NSIndexPath
#undef  PIndexPath
#define PIndexPath(section, row)  [NSIndexPath indexPathForRow:row inSection:section]

#pragma mark - 图片
#undef  PImageNamed
#define PImageNamed(imageName)    [UIImage imageNamed:imageName]

#pragma mark - 设备型号
#define PIsIphoneDevice (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define PIsIpadDevice   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#endif /* Fun+pPrefix_h */
