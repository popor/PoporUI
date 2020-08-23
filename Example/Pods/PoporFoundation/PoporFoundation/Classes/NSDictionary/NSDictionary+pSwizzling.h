//
//  NSDictionary+pSwizzling.h
//  PoporFoundation
//
//  Created by popor on 2018/1/26.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 测试代码1 : 初始化
//{
//    NSString * w1 = nil;
//    NSDictionary * dic0 = @{@"w0":@"w0", @"w1":w1};
//    NSDictionary * dic1 = @{@"001":@{@"001":@"001", @"002":w1}, @"002":@{@"101":@"101", @"102":w1}, @"003":@{@"201":w1}, @"301":w1, @"401":@"401"};
//}

// 测试代码2 : set
//{
//    NSMutableDictionary * dic = [NSMutableDictionary new];
//    [dic setObject:nil forKey:@"444"];
//}

//作者：小樊
//链接：https://www.jianshu.com/p/ea4c79bedbbf
//來源：简书
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

@interface NSDictionary (pSwizzling)

@end

NS_ASSUME_NONNULL_END
