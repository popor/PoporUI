//
//  NSArray+pSwizzling.m
//  PoporFoundation
//
//  Created by popor on 2018/1/26.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSArray+pSwizzling.h"

#import "NSObject+pSwizzling.h"

// ---- 原因https://blog.csdn.net/wxs0124/article/details/50148873
//自定义的打印日志宏 如：
//＃define TWLOGPRINT(xx, …) NSLog(@”%s(%d): ” xx, PRETTY_FUNCTION, LINE, ##VA_ARGS)
//这个宏定义放在了 A.h 中 在B.m文件中使用的时候没有＃import “A.h”
//
//解决办法：
//＃import ”宏定义所在的文件“
//#import "NSString+Tool.h"
#import "Fun+pPrefix.h"

//+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector;

@implementation NSArray (pSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 初始化
        [objc_getClass("__NSPlaceholderArray") methodSwizzlingWithOriginalSelector:@selector(initWithObjects:count:)  bySwizzledSelector:@selector(safeInitWithObjects:count:)];
        
        // NSMutableArray copy = __NSSingleObjectArrayI.
        [objc_getClass("__NSSingleObjectArrayI") methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:)  bySwizzledSelector:@selector(safe_objectAtIndex_SI:)];
        
        // 这个是语法糖写法
        [objc_getClass("__NSArrayI") methodSwizzlingWithOriginalSelector:@selector(objectAtIndexedSubscript:)  bySwizzledSelector:@selector(safe_objectAtIndexedSubscript_I:)];
        // 普通提取
        [objc_getClass("__NSArrayI") methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:)  bySwizzledSelector:@selector(safe_objectAtIndex_I:)];
    });
}

- (instancetype)safeInitWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    BOOL hasNilObject = NO;
    for (NSUInteger i = 0; i < cnt; i++) {
        if ([objects[i] isKindOfClass:[NSArray class]]) {
            //NSLog(@"%@", objects[i]);
        }
        if (objects[i] == nil) {
            hasNilObject = YES;
            //NSLog(@"%s object at index %lu is nil, it will be     filtered", __FUNCTION__, i);
            NSLogError(@"数组初始化不能为nil，其index为: %lu", i);
            //#if DEBUG
            // // 如果可以对数组中为nil的元素信息打印出来，增加更容易读懂的日志信息，这对于我们改bug就好定位多了
            // NSString *errorMsg = [NSString stringWithFormat:@"数组元素不能为nil，其index为: %lu", i];
            // NSAssert(objects[i] != nil, errorMsg);
            //#endif
        }
    }
    
    // 因为有值为nil的元素，那么我们可以过滤掉值为nil的元素
    if (hasNilObject) {
        id __unsafe_unretained newObjects[cnt];
        NSUInteger index = 0;
        for (NSUInteger i = 0; i < cnt; ++i) {
            if (objects[i] != nil) {
                newObjects[index++] = objects[i];
            }
        }
        return [self safeInitWithObjects:newObjects count:index];
    }
    return [self safeInitWithObjects:objects count:cnt];
}

// NSMutableArray copy = __NSSingleObjectArrayI, 此时包括语法糖和普通取值
- (id)safe_objectAtIndex_SI:(NSUInteger)index {
    if (self.count == 0) {
        NSLogError(@"NSSingleObjectArrayI 数组提取, 数组不能为空, %s, at:%li", __FUNCTION__, index);
        // NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLogError(@"NSSingleObjectArrayI 数组提取, 不能越界, %s, at:%li", __FUNCTION__, index);
        //NSLog(@"%s index out of bounds in array", __FUNCTION__);
        return nil;
    }
    return [self safe_objectAtIndex_SI:index];
}

- (id)safe_objectAtIndexedSubscript_I:(NSUInteger)idx {
    //作者：如风如花不如你
    //链接：https://www.jianshu.com/p/25da81f3a1ca
    //來源：简书
    //著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
    if (self.count == 0) {
        NSLogError(@"NSArray Subscript 语法糖 数组提取, 数组不能为空, %s, at:%li", __FUNCTION__, idx);
        // NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (idx >= self.count) {
        NSLogError(@"NSArray Subscript 语法糖 数组提取, 不能越界, %s, at:%li", __FUNCTION__, idx);
        //NSLog(@"%s index out of bounds in array", __FUNCTION__);
        return nil;
    }
    return [self safe_objectAtIndexedSubscript_I:idx];
    
}

- (id)safe_objectAtIndex_I:(NSUInteger)idx {
    if (self.count == 0) {
        NSLogError(@"NSArray 数组提取, 数组不能为空, %s, at:%li", __FUNCTION__, idx);
        // NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (idx >= self.count) {
        NSLogError(@"NSArray 数组提取, 不能越界, %s, at:%li", __FUNCTION__, idx);
        //NSLog(@"%s index out of bounds in array", __FUNCTION__);
        return nil;
    }
    return [self safe_objectAtIndex_I:idx];
}

@end
