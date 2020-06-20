//
//  NSString+pAtt.h
//  PoporFoundation
//
//  Created by popor on 2016/11/8.
//  Copyright © 2016年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Os+pPrefix.h"

NS_ASSUME_NONNULL_BEGIN


@interface NSString (pAtt)

+ (NSMutableAttributedString *)underLineAttString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color;

@end


@interface NSMutableAttributedString (pAtt)

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color;

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color underline:(BOOL)isUnderLine;

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color bgColor:(COLOR_CLASS * _Nullable)bgColor underline:(BOOL)isUnderLine;

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color bgColor:(COLOR_CLASS * _Nullable)bgColor underline:(BOOL)isUnderLine lineSpacing:(CGFloat)lineSpacing textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode;

// 用于纠正不同字体之间的文字,不会行居中的问题
- (void)setBaselineOffsetMaxFont:(CGFloat)maxFont miniFont:(CGFloat)miniFont range:(NSRange)range;
- (void)setBaselineOffsetMaxFont:(CGFloat)maxFont miniFont:(CGFloat)miniFont range:(NSRange)range scale:(CGFloat)scale;

// MARK: 生成具有间隔的att, 例如身份证、电话号码、银行卡、金钱数等
/**
 *  普通信息
 *
 *  @param text 文本
 *  @param bigGap 大间隔宽度,默认为6
 *  @param smallGap 大间隔宽度,默认为0
 *  @param separateNumberArray 大间隔点数组,里面的参数为NSNumber, 示例: 中国电话号码为 @[@2, @6, @10]
 *
 */
+ (NSMutableAttributedString *)separateText:(NSString *)text bigGap:(NSInteger)bigGap smallGap:(NSInteger)smallGap separateNumberArray:(NSArray *)separateNumberArray;

/**
*  普通信息
*
*  @param text 文本
*  @param bigGap 大间隔宽度,默认为6
*  @param smallGap 大间隔宽度,默认为0
*  @param separateNumber 间隔分割间隔, 默认为4, 针对银行卡号
*/
+ (NSMutableAttributedString *)separateText:(NSString *)text bigGap:(NSInteger)bigGap smallGap:(NSInteger)smallGap separateNumber:(NSInteger)separateNumber;

/**
*  金钱信息
*
*  @param text 文本
*  @param bigGap 大间隔宽度,默认为6
*  @param smallGap 大间隔宽度,默认为0
*  @param separateNumber 间隔分割间隔, 默认为4, 针对中国数字习惯
*/
+ (NSMutableAttributedString *)separateMoneyText:(NSString *)text bigGap:(NSInteger)bigGap smallGap:(NSInteger)smallGap separateNumber:(NSInteger)separateNumber;

@end

@interface NSAttributedString (pAtt)

#pragma mark - Size Department
- (CGSize)sizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
