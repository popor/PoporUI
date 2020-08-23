//
//  NSArray+pSwizzling.h
//  PoporFoundation
//
//  Created by popor on 2018/1/26.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 测试代码
//{
//    NSMutableArray *array = [@[@"value", @"value1"] mutableCopy];
//    [array lastObject];
//
//    [array removeObject:@"value"];
//    [array removeObject:nil];
//    [array addObject:@"12"];
//    [array addObject:nil];
//    [array insertObject:nil atIndex:0];
//    [array insertObject:@"sdf" atIndex:10];
//    [array objectAtIndex:100];
//    [array removeObjectAtIndex:10];
//
//    NSMutableArray *anotherArray = [[NSMutableArray alloc] init];
//    [anotherArray objectAtIndex:0];
//
//    NSString *nilStr = nil;
//    NSArray *array1 = @[@"ara", @"sdf", @"dsfdsf", nilStr];
//    NSLog(@"array1.count = %lu", array1.count);
//
//    // 测试数组中有数组
//    NSArray *array2 = @[@[@"11111", @"111111", nilStr, nilStr], @[@"222222", @"222222", nilStr, @"sdhfodf"]];
//}

// 测试代码
//dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//    NSString * wkq = nil;
//    NSArray * array = @[@"1", wkq, @"3"];
//    array[3];
//    [array objectAtIndex:3];
//    NSArray * arrayCopy = [array copy];
//    arrayCopy[3];
//    [arrayCopy objectAtIndex:3];
//
//    @[@"1", wkq, @"3"][5];
//    NSLog(@"_________\n");
//    NSMutableArray * mArray = [NSMutableArray new];//[@[@"34"] mutableCopy];
//    [mArray addObject:@"1"];
//    mArray[3];
//    [mArray objectAtIndex:3];
//
//    mArray = [@[@"34"] copy];
//    mArray[3];
//    [mArray objectAtIndex:3];
//});

//作者：熊桥桥桥桥桥桥
//链接：https://www.jianshu.com/p/080a238c62b9
//來源：简书
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

// NSArray 数组为空的话,就无法屏蔽出错了.
@interface NSArray (pSwizzling)

@end

NS_ASSUME_NONNULL_END
