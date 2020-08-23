//
//  NSMutableArray+pSwizzling.m
//  PoporFoundation
//
//  Created by popor on 2018/2/1.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSMutableArray+pSwizzling.h"

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

@implementation NSMutableArray (pSwizzling)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(removeObject:) bySwizzledSelector:@selector(safeRemoveObject:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(addObject:)  bySwizzledSelector:@selector(safeAddObject:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(removeObjectAtIndex:)  bySwizzledSelector:@selector(safeRemoveObjectAtIndex:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(insertObject:atIndex:)  bySwizzledSelector:@selector(safeInsertObject:atIndex:)];
        
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:)  bySwizzledSelector:@selector(safe_objectAtIndex_M:)];
        
        // 语法糖写法
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(objectAtIndexedSubscript:)  bySwizzledSelector:@selector(safe_objectAtIndexedSubscript_M:)];
    });
}

- (void)safeAddObject:(id)obj {
    if (obj == nil) {
        //NSLog(@"%s can add nil object into NSMutableArray", __FUNCTION__);
        NSLogError(@"数组添加实体, 不能为nil，%s", __FUNCTION__);
    } else {
        [self safeAddObject:obj];
    }
}
- (void)safeRemoveObject:(id)obj {
    if (obj == nil) {
        NSLogError(@"数组移除实体, 不能为nil，%s", __FUNCTION__);
        //NSLog(@"%s call -removeObject:, but argument obj is nil", __FUNCTION__);
        return;
    }
    [self safeRemoveObject:obj];
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        NSLogError(@"数组指定index添加, 添加不能为nil, %s, at:%li", __FUNCTION__, index);
        //NSLog(@"%s can't insert nil into NSMutableArray", __FUNCTION__);
    } else if (index > self.count) {
        NSLogError(@"数组指定index添加, 不能越界, %s, at:%li", __FUNCTION__, index);
        //NSLog(@"%s index is invalid", __FUNCTION__);
    } else {
        [self safeInsertObject:anObject atIndex:index];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        //NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        NSLogError(@"数组移除Index, 数组不能为空，%s, at:%li", __FUNCTION__, index);
        return;
    }
    if (index >= self.count) {
        NSLogError(@"数组移除Index, 不能越界，%s, at:%li", __FUNCTION__, index);
        //NSLog(@"%s index out of bound", __FUNCTION__);
        return;
    }
    [self safeRemoveObjectAtIndex:index];
}

// NSMutableArray
- (id)safe_objectAtIndex_M:(NSUInteger)index {
    if (self.count == 0) {
        NSLogError(@"NSMutableArray 数组提取, 数组不能为空, %s, at:%li", __FUNCTION__, index);
        // NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLogError(@"NSMutableArray 数组提取, 不能越界, %s, at:%li", __FUNCTION__, index);
        //NSLog(@"%s index out of bounds in array", __FUNCTION__);
        return nil;
    }
    return [self safe_objectAtIndex_M:index];
}

// 语法糖写法
- (id)safe_objectAtIndexedSubscript_M:(NSUInteger)idx {
    //作者：如风如花不如你
    //链接：https://www.jianshu.com/p/25da81f3a1ca
    //來源：简书
    //著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
    if (self.count == 0) {
        NSLogError(@"NSMutableArray Subscript 语法糖 数组提取, 数组不能为空, %s, at:%li", __FUNCTION__, idx);
        // NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (idx >= self.count) {
        NSLogError(@"NSMutableArrays Subscript 语法糖 数组提取, 不能越界, %s, at:%li", __FUNCTION__, idx);
        //NSLog(@"%s index out of bounds in array", __FUNCTION__);
        return nil;
    }
    return [self safe_objectAtIndexedSubscript_M:idx];
    
}


@end
