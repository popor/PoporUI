//
//  NSObject+pSwizzling.h
//  PoporFoundation
//
//  Created by popor on 2017/10/25.
//  Copyright © 2017年 popor. All rights reserved.
//
/**
 OCDynamicHookUtils
 https://github.com/enefry/OCDynamicHookUtils
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable (^OCDynamicHookUtilsImpCallback)(id self,...);

@interface NSObject (pSwizzling)

// 交换 NSObject 方法
+ (void)methodSwizzlingWithOriginalSelector:(SEL _Nonnull)originalSelector bySwizzledSelector:(SEL _Nonnull)swizzledSelector;

+ (void)SwizzleInstanceMethod:(SEL _Nonnull)originalSelector withMethod:(SEL _Nonnull)swizzledSelector;

// 交换 Class 方法
+ (BOOL)SwizzleClass:(Class)destClass classMethod:(SEL)originalSelector withMethod:(SEL)newSelector;

//
+ (BOOL)SwizzleClass:(Class _Nonnull)destClass instanceMethod:(SEL _Nonnull)originalSelector withMethod:(SEL _Nonnull)newSelector;

// Class
+ (BOOL)AddClassMethod:(const char* _Nullable)methodTypes toSelector:(SEL _Nonnull)selector implement:(IMP _Nonnull)imp toClass:(Class _Nullable)destClass;
// NSObject
+ (BOOL)AddInstanceMethod:(const char* _Nullable)methodTypes toSelector:(SEL _Nonnull)selector implement:(IMP _Nonnull)imp toClass:(Class _Nullable)destClass;
// 给 NSObject 函数添加钩子
+ (BOOL)AddHookInstanceMethodImp:(OCDynamicHookUtilsImpCallback _Nonnull)callback toClassName:(NSString* _Nonnull)className toReplaceSelectorName:(NSString* _Nonnull)selectorName;
// 给 Class 函数添加钩子
+ (BOOL)AddHookClassMethodImp:(OCDynamicHookUtilsImpCallback _Nonnull)callback toClassName:(NSString* _Nonnull)className toReplaceSelectorName:(NSString* _Nonnull)selectorName;

+ (BOOL)AddHookInstanceMethodImp:(OCDynamicHookUtilsImpCallback _Nonnull)callback toClass:(Class _Nonnull)destaClass toReplaceSelector:(SEL _Nonnull)selector;

@end

NS_ASSUME_NONNULL_END
