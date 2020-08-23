//
//  NSURL+pSwizzling.m
//  PoporFoundation
//
//  Created by popor on 2018/4/21.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSURL+pSwizzling.h"

#import "NSObject+pSwizzling.h"
#import "NSString+pTool.h"

@implementation NSURL (pSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // - 方法
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initFileURLWithPath:isDirectory:relativeToURL:) bySwizzledSelector:@selector(safeInitFileURLWithPath:isDirectory:relativeToURL:)];
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initFileURLWithPath:relativeToURL:) bySwizzledSelector:@selector(safeInitFileURLWithPath:relativeToURL:)];
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initFileURLWithPath:isDirectory:) bySwizzledSelector:@selector(safeInitFileURLWithPath:isDirectory:)];
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initFileURLWithPath:) bySwizzledSelector:@selector(safeInitFileURLWithPath:)];
        
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initWithString:) bySwizzledSelector:@selector(safeInitWithString:)];
        [objc_getClass("NSURL") methodSwizzlingWithOriginalSelector:@selector(initWithString:relativeToURL:) bySwizzledSelector:@selector(safeInitWithString:relativeToURL:)];
    });
}

// MARK: 0.0.36 之后不再对 filrUrl 进行toUrlEncode, 因为发现 AVAudioPlayer 使用本地url不能将汉字转换为 urlCode .
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

- (instancetype)safeInitWithString:(NSString *)URLString {
    if (!URLString) {
        return nil;
    }
    return [self safeInitWithString:URLString.toUrlEncode];
}
- (instancetype)safeInitWithString:(NSString *)URLString relativeToURL:(nullable NSURL *)baseURL {
    if (!URLString) {
        return nil;
    }
    return [self safeInitWithString:URLString.toUrlEncode relativeToURL:baseURL];
}

@end
