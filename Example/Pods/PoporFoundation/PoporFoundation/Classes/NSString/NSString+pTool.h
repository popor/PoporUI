//
//  NSString+pTool.h
//  PoporFoundation
//
//  Created by popor on 2016/12/28.
//  Copyright © 2016年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Os+pPrefix.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (pTool)

#pragma mark - 判断空字符串
+ (BOOL)isNullToString:(NSString * _Nullable)string;

#pragma mark - 正则部分
/*
 NSString * text = @"Liu De Hua";
 NSString * reg0 = @"(\\w)\\w*\\s*";
 NSString * reg1 = @"$1"; // $0 是自身, $1是第一个小括号里面的东西
 
 text = [text replaceWithREG:reg0 newString:reg1];
 
 theNewString 可以是string, 也可以是reg.
 */
- (NSString *)replaceWithREG:(NSString * _Nonnull)reg newString:(NSString * _Nonnull)theNewString;

- (NSString *)cleanWithREG:(NSString * _Nonnull)reg;
- (NSString *)stringWithREG:(NSString * _Nonnull)reg;

#pragma mark - 10-16转换
+ (NSString *)stringToHexWithInt:(NSInteger)theNumber;
+ (NSString *)stringToDecimalWithString:(NSString * _Nonnull)theNumber;

- (NSDictionary *)toDic;

#pragma mark [获取 一个GUID]
+ (NSString *)getUUID;

#pragma mark 空格URL
- (NSString *)toUrlEncode;

- (NSString *)toUtf8Encode;

- (NSString *)toChinaPhoneString;
- (BOOL)isPhoneNum;

- (NSData *)toData;

- (NSInteger)countOccurencesOfString:(NSString * _Nonnull)searchString;

- (COLOR_CLASS *)toColor;

// 假如小数点个数为.00, 则不显示小数点后的数字
+ (NSString *)simplePrice:(CGFloat)price;

@end

NS_ASSUME_NONNULL_END
