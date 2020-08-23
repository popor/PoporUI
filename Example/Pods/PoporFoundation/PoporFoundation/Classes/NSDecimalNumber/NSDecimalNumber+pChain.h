//
//  NSDecimalNumber+pChain.h
//  PoporFoundation
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define DecNumStr(string) [NSDecimalNumber decimalNumberWithString:string]

@interface NSDecimalNumber (pChain)

- (NSDecimalNumber *(^)(NSDecimalNumber *))add;
- (NSDecimalNumber *(^)(NSDecimalNumber *))sub;
- (NSDecimalNumber *(^)(NSDecimalNumber *))mul;
- (NSDecimalNumber *(^)(NSDecimalNumber *))div;

- (NSDecimalNumber *(^)(id <NSDecimalNumberBehaviors>))behavior;

@end

NS_ASSUME_NONNULL_END
