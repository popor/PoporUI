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

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color bgColor:(COLOR_CLASS * _Nullable)bgColor underline:(BOOL)isUnderLine lineSpacing:(float)lineSpacing textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode;

// 用于纠正不同字体之间的文字,不会行居中的问题
- (void)setBaselineOffsetMaxFont:(float)maxFont miniFont:(float)miniFont range:(NSRange)range;
- (void)setBaselineOffsetMaxFont:(float)maxFont miniFont:(float)miniFont range:(NSRange)range scale:(float)scale;

#pragma mark - Size Department
- (CGSize)sizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
