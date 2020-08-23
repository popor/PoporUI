//
//  NSObject+pSafeKVO.h
//  PoporFoundation
//
//  Created by popor on 2017/3/17.
//  Copyright © 2017年 popor. All rights reserved.
//

/**
 Fix KVO's crashes. 
 You can [NSObject wm_addObserver:forKeyPath:context] repeatedly and
 do not worry about removeObserver. This implementation will auto
 removeObserver when observer or observered object dealloc.
 
 KVO crash in three situations:
 1. The time of calling [NSObject removeObserver:forKeyPath:context] 
    more than [NSObject addObserver:forKeyPath:context].
 2. Forget to call [NSObject removeObserver:forKeyPath:context]
    when observer or observered object dealloc and you called
    [NSObject addObserver:forKeyPath:options:context:].
 **/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


// 原始 @interface NSObject (WMSafeKVO)
@interface NSObject (pSafeKVO)

- (void)wm_addObserver:(NSObject * _Nullable)observer
            forKeyPath:(NSString * _Nullable)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void * _Nullable)context;

- (void)wm_removeObserver:(NSObject * _Nullable)observer
               forKeyPath:(NSString * _Nullable)keyPath
                  context:(void * _Nullable)context;

- (void)wm_removeObserver:(NSObject * _Nullable)observer
               forKeyPath:(NSString * _Nullable)keyPath;

@end

NS_ASSUME_NONNULL_END
