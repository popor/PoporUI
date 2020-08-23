//
//  NSDictionary+pSwizzling.m
//  PoporFoundation
//
//  Created by popor on 2018/1/26.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSDictionary+pSwizzling.h"

#import "NSObject+pSwizzling.h"

// ---- 原因https://blog.csdn.net/wxs0124/article/details/50148873
//自定义的打印日志宏 如：
//＃define TWLOGPRINT(xx, …) NSLog(@”%s(%d): ” xx, PRETTY_FUNCTION, LINE, ##VA_ARGS)
//这个宏定义放在了 A.h 中 在B.m文件中使用的时候没有＃import “A.h”
//
//解决办法：
//＃import ”宏定义所在的文件“
#import "Fun+pPrefix.h"

@implementation NSDictionary (pSwizzling)

/**
 一个objc程序启动后，需要进行类的初始化、调用方法时的cache初始化，再发送消息的时候就直接走缓存
 （引申：+load方法和+initialize方法。load方法是首次加载类时调用，绝对只调用一次；
 initialize方法是首次给类发消息时调用，通常只调用一次，
 但如果它的子类初始化时未定义initialize方法，则会再调用一次它的initialize方法）。
 */
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 初始化
        [objc_getClass("__NSPlaceholderDictionary") methodSwizzlingWithOriginalSelector:@selector(initWithObjects:forKeys:count:)  bySwizzledSelector:@selector(safeInitWithObjects:forKeys:count:)];
        [objc_getClass("__NSDictionaryM") methodSwizzlingWithOriginalSelector:@selector(setObject:forKey:)  bySwizzledSelector:@selector(setSafeObject:forKey:)];
    });
}

- (instancetype)safeInitWithObjects:(const id _Nonnull __unsafe_unretained *)objects forKeys:(const id _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    BOOL containNilObject = NO;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (objects[i] == nil) {
            containNilObject = YES;
#if DEBUG
            NSObject * key = keys[i];
            if ([key isKindOfClass:[NSString class]]) {
                NSLogError(@"字典初始化出错: key: %@ 的value为nil ", key);
            }else{
                NSLogError(@"字典初始化出错: key: %@ 的value为nil ", NSStringFromClass([key class]));
            }
#endif
        }
    }
    if (containNilObject) {
        NSUInteger nilCount = 0;
        for (NSUInteger i = 0; i < cnt; ++i) {
            if (objects[i] == nil) {
                nilCount ++;
            }
        }
        NSUInteger length = cnt - nilCount;
        if (length > 0) {
            NSUInteger index = 0;
            id __unsafe_unretained newObjects[length];
            id __unsafe_unretained newKeys[length];
            for (NSUInteger i = 0; i < cnt; ++i) {
                if (objects[i] != nil) {
                    newObjects[index] = objects[i];
                    newKeys[index] = keys[i];
                    index ++ ;
                }
            }
            NSDictionary * dic = [self safeInitWithObjects:newObjects forKeys:newKeys count:length];
            NSLogError(@"字典初始化修改的为 :%@", dic);
            return dic;
        } else {
            NSLogError(@"字典初始化修改的为 空");
            return nil;
        }
    }
    return [self safeInitWithObjects:objects forKeys:keys count:cnt];
}

- (void)setSafeObject:obj forKey:key {
    if (obj == nil) {
#if DEBUG
        if ([key isKindOfClass:[NSString class]]) {
            NSLogError(@"字典设置key:%@ 的value为空", key);
        }else{
            NSLogError(@"字典设置key:%@ 的value为空", NSStringFromClass([key class]));
        }
#endif
    }
    else if (key == nil) {
#if DEBUG
        NSLogError(@"字典设置key为空");
#endif
    }
    else{
        [self setSafeObject:obj forKey:key];
        //NSLogSuccess(@"key:%@, obj:%@", key, NSStringFromClass([obj class]));
    }
}

@end
