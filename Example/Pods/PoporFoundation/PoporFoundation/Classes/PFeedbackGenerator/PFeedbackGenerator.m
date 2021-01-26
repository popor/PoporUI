//
//  PFeedbackGenerator.m
//  PoporFoundation
//
//  Created by popor on 2020/12/23.
//  Copyright © 2020 popor. All rights reserved.
//

#import "PFeedbackGenerator.h"

#if TARGET_OS_IOS

@implementation PFeedbackGenerator

+ (instancetype)share {
    static dispatch_once_t once;
    static PFeedbackGenerator * instance;
    dispatch_once(&once, ^{
        instance = [self new];
        instance.shakeEnable = [[self class] get__shake];
    });
    return instance;
}

+ (void)shakePhone {
    if (@available(iOS 10, *)) {
        static UISelectionFeedbackGenerator * fg;
        if (!fg) {
            fg = [UISelectionFeedbackGenerator new];
        }
        PFeedbackGenerator * tool = [PFeedbackGenerator share];
        
        if (tool.shakeEnable) {
            [fg selectionChanged];
        }
    }
}

+ (void)shakeLight {
    if (@available(iOS 10, *)) {
        static UIImpactFeedbackGenerator * fg;
        if (!fg) {
            fg = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        }
        PFeedbackGenerator * tool = [PFeedbackGenerator share];
        
        if (tool.shakeEnable) {
            [fg impactOccurred];
        }
    }
}

+ (void)shakeMedium {
    if (@available(iOS 10, *)) {
        static UIImpactFeedbackGenerator * fg;
        if (!fg) {
            fg = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        }
        PFeedbackGenerator * tool = [PFeedbackGenerator share];
        
        if (tool.shakeEnable) {
            [fg impactOccurred];
        }
    }
}

+ (void)shakeHeavy {
    if (@available(iOS 10, *)) {
        static UIImpactFeedbackGenerator * fg;
        if (!fg) {
            fg = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
        }
        PFeedbackGenerator * tool = [PFeedbackGenerator share];
        
        if (tool.shakeEnable) {
            [fg impactOccurred];
        }
    }
}

- (void)setShakeEnable:(BOOL)shakeEnable {
    [[self class] save__shake:shakeEnable];
    _shakeEnable = shakeEnable;
}

// https://stackoom.com/question/2ntY2/如何检查是否支持Haptic-Engine-UIFeedbackGenerator .
+ (BOOL)isDeviceSupportFeedback {
    if (@available(iOS 10, *)) {
        UIImpactFeedbackGenerator * fg = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
        [fg prepare];
        NSString * des = fg.description;
        // NSLogString(des);
        // iphoneSE    des = <UIImpactFeedbackGenerator: 0x28070e010: prepared=0>
        // iphoneXsMax des = <UIImpactFeedbackGenerator: 0x282b7c3c0: style=Heavy>
        
        if ([des containsString:@"Heavy"]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

+ (void)selectionFgPrepare {
    if (@available(iOS 10, *)) {
        PFeedbackGenerator * share = [PFeedbackGenerator share];
        if (!share.selectionFG) {
            share.selectionFG = [UISelectionFeedbackGenerator new];
        }
        [share.selectionFG prepare];
    }
}

+ (void)selectionFgChange {
    if (@available(iOS 10, *)) {
        PFeedbackGenerator * share = [PFeedbackGenerator share];
        if (!share.selectionFG) {
            [self selectionFgPrepare];
        }
        [share.selectionFG selectionChanged];
    }
}

+ (void)selectionFgEnd {
    if (@available(iOS 10, *)) {
        PFeedbackGenerator * share = [PFeedbackGenerator share];
        if (share.selectionFG) {
            share.selectionFG = nil;
        }
    }
}

#pragma mark - setget
+ (void)save__shake:(BOOL)__shake {
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%i", __shake] forKey:[self shakeKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)get__shake {
    NSString * info = [[NSUserDefaults standardUserDefaults] objectForKey:[self shakeKey]];
    if (info.length == 0) {
        return YES;
    } else {
        return [info boolValue];
    }
}

+ (NSString *)shakeKey {
    return [NSString stringWithFormat:@"%@-%@", NSStringFromClass([self class]), @"shake"];
}

@end

#else

@implementation PFeedbackGenerator @end

#endif


