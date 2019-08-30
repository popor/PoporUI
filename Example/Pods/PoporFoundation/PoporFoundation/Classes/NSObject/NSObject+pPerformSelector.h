//
//  NSObject+pPerformSelector.h
//  PoporFoundation
//
//  Created by popor on 2017/10/25.
//  Copyright © 2017年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)
/*
 作者：戴仓薯
 链接：https://www.jianshu.com/p/6517ab655be7
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 
 */

@interface NSObject (pPerformSelector)

+ (void)target:(id)target voidAction:(SEL)action;

@end

NS_ASSUME_NONNULL_END
