//
//  NSString+pSwizzling.m
//  Pods-PoporFoundation_Example
//
//  Created by apple on 2019/12/19.
//

#import "NSString+pSwizzling.h"

#import "NSObject+pSwizzling.h"
#import "Fun+pPrefix.h"

@implementation NSString (pSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSCFConstantString") methodSwizzlingWithOriginalSelector:@selector(substringFromIndex:) bySwizzledSelector:@selector(safeSubstringFromIndex:)];
        [objc_getClass("__NSCFConstantString") methodSwizzlingWithOriginalSelector:@selector(substringToIndex:) bySwizzledSelector:@selector(safeSubstringToIndex:)];
        [objc_getClass("__NSCFConstantString") methodSwizzlingWithOriginalSelector:@selector(substringWithRange:) bySwizzledSelector:@selector(safeSubstringWithRange:)];
        
    });
}

- (NSString *)safeSubstringFromIndex:(NSUInteger)from {
    if (self.length < from) {
        NSLogError(@"NSString 越界, %s", __FUNCTION__);
        return nil;
    } else {
        return [self safeSubstringFromIndex:from];
    }
}

- (NSString *)safeSubstringToIndex:(NSUInteger)to {
    if (self.length < to) {
        NSLogError(@"NSString 越界, %s", __FUNCTION__);
        return nil;
    } else {
        return [self safeSubstringToIndex:to];
    }
}

- (NSString *)safeSubstringWithRange:(NSRange)range {
    if (self.length < range.location+range.length) {
        NSLogError(@"NSString 越界, %s", __FUNCTION__);
        return nil;
    } else {
        return [self safeSubstringWithRange:range];
    }
}

@end
