//
//  NSURL+Swizzling.m
//  linRunShengPi
//
//  Created by popor on 2018/4/21.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSURL+Swizzling.h"
#import <objc/runtime.h>

#import "NSObject+Swizzling.h"

@implementation NSURL (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // - 方法
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initFileURLWithPath:isDirectory:relativeToURL:) bySwizzledSelector:@selector(safeInitFileURLWithPath:isDirectory:relativeToURL:)];
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initFileURLWithPath:relativeToURL:) bySwizzledSelector:@selector(safeInitFileURLWithPath:relativeToURL:)];
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initFileURLWithPath:isDirectory:) bySwizzledSelector:@selector(safeInitFileURLWithPath:isDirectory:)];
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initFileURLWithPath:) bySwizzledSelector:@selector(safeInitFileURLWithPath:)];
    });
}

// - 方法
- (instancetype)safeInitFileURLWithPath:(NSString *)path isDirectory:(BOOL)isDir relativeToURL:(nullable NSURL *)baseURL {
    if (!path) {
        return nil;
    }
    return [self safeInitFileURLWithPath:path isDirectory:isDir relativeToURL:baseURL];
}

- (instancetype)safeInitFileURLWithPath:(NSString *)path relativeToURL:(nullable NSURL *)baseURL {
    if (!path) {
        return nil;
    }
    return [self safeInitFileURLWithPath:path relativeToURL:baseURL];
}
- (instancetype)safeInitFileURLWithPath:(NSString *)path isDirectory:(BOOL)isDir {
    if (!path) {
        return nil;
    }
    return [self safeInitFileURLWithPath:path isDirectory:isDir];
}

- (instancetype)safeInitFileURLWithPath:(NSString *)path {
    if (!path) {
        return nil;
    }
    return [self safeInitFileURLWithPath:path];
}

@end
