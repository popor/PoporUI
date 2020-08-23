//
//  NSDecimalNumber+pSwizzling.m
//  PoporFoundation
//
//  Created by popor on 2018/6/28.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSDecimalNumber+pSwizzling.h"
#import "NSDecimalNumber+pChain.h"
#import "NSObject+pSwizzling.h"

@implementation NSDecimalNumber (pSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [objc_getClass("NSDecimalNumber") methodSwizzlingWithOriginalSelector:@selector(decimalNumberByAdding:withBehavior:)  bySwizzledSelector:@selector(decimalNumberByAddingSafe:withBehavior:)];
        [objc_getClass("NSDecimalNumber") methodSwizzlingWithOriginalSelector:@selector(decimalNumberBySubtracting:withBehavior:)  bySwizzledSelector:@selector(decimalNumberBySubtractingSafe:withBehavior:)];
        [objc_getClass("NSDecimalNumber") methodSwizzlingWithOriginalSelector:@selector(decimalNumberByMultiplyingBy:withBehavior:)  bySwizzledSelector:@selector(decimalNumberByMultiplyingBySafe:withBehavior:)];
        [objc_getClass("NSDecimalNumber") methodSwizzlingWithOriginalSelector:@selector(decimalNumberByDividingBy:withBehavior:)  bySwizzledSelector:@selector(decimalNumberByDividingBySafe:withBehavior:)];
    });
}

- (NSDecimalNumber *)decimalNumberByAddingSafe:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior{
    
    if ([self compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.notANumber] == NSOrderedSame) {
        return NSDecimalNumber.notANumber;
    }else {
        return [self decimalNumberByAddingSafe:decimalNumber withBehavior:behavior];
    }
}

- (NSDecimalNumber *)decimalNumberBySubtractingSafe:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior {
    if ([self compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.notANumber] == NSOrderedSame) {
        return NSDecimalNumber.notANumber;
    }else {
        return [self decimalNumberBySubtractingSafe:decimalNumber withBehavior:behavior];
    }
}

- (NSDecimalNumber *)decimalNumberByMultiplyingBySafe:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior {
    if ([self compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.notANumber] == NSOrderedSame) {
        return NSDecimalNumber.notANumber;
    }else {
        return [self decimalNumberByMultiplyingBySafe:decimalNumber withBehavior:behavior];
    }
}

- (NSDecimalNumber *)decimalNumberByDividingBySafe:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior {
    if ([self compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.zero] == NSOrderedSame) {
        return NSDecimalNumber.notANumber;
    }else {
        return [self decimalNumberByDividingBySafe:decimalNumber withBehavior:behavior];
    }
}

@end
