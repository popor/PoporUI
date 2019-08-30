//
//  NSObject+pSwizzling.h
//  PoporFoundation
//
//  Created by popor on 2017/10/25.
//  Copyright © 2017年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable (^OCDynamicHookUtilsImpCallback)(id self,...);

@interface NSObject (pSwizzling)

// 交换方法
+ (void)methodSwizzlingWithOriginalSelector:(SEL _Nonnull)originalSelector bySwizzledSelector:(SEL _Nonnull)swizzledSelector;

/**
 OCDynamicHookUtils
 https://github.com/enefry/OCDynamicHookUtils
 */
+ (BOOL)SwizzleClass:(Class _Nonnull)destClass instanceMethod:(SEL _Nonnull)originalSelector withMethod:(SEL _Nonnull)newSelector;

+ (BOOL)SwizzleClass:(Class _Nonnull)destClass classMethod:(SEL _Nonnull)originalSelector withMethod:(SEL _Nonnull)newSelector;

+ (BOOL)AddClassMethod:(const char* _Nullable)methodTypes toSelector:(SEL _Nonnull)selector implement:(IMP _Nonnull)imp toClass:(Class _Nullable)destClass;

+ (BOOL)AddInstanceMethod:(const char* _Nullable)methodTypes toSelector:(SEL _Nonnull)selector implement:(IMP _Nonnull)imp toClass:(Class _Nullable)destClass;

+ (BOOL)AddHookInstanceMethodImp:(OCDynamicHookUtilsImpCallback _Nonnull)callback toClass:(Class _Nonnull)destaClass toReplaceSelector:(SEL _Nonnull)selector;

+ (BOOL)AddHookInstanceMethodImp:(OCDynamicHookUtilsImpCallback _Nonnull)callback toClassName:(NSString* _Nonnull)className toReplaceSelectorName:(NSString* _Nonnull)selectorName;

+ (BOOL)AddHookClassMethodImp:(OCDynamicHookUtilsImpCallback _Nonnull)callback toClassName:(NSString* _Nonnull)className toReplaceSelectorName:(NSString* _Nonnull)selectorName;

@end

NS_ASSUME_NONNULL_END
