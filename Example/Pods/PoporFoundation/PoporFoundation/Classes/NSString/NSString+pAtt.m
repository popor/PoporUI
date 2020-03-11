//
//  NSString+pAtt.m
//  PoporFoundation
//
//  Created by popor on 2016/11/8.
//  Copyright © 2016年 popor. All rights reserved.
//

#import "NSString+pAtt.h"
#import <CoreText/CoreText.h>
#import "NSString+pTool.h"

//#pragma mark - iOS
//#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
@implementation NSString (pAtt)

+ (NSMutableAttributedString *)underLineAttString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color
{
    if (!string || !font|| !color) {
        return nil;
    }
    NSRange range = (NSRange){0, string.length};
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    // 下划线
    [attString addAttribute:(NSString*)kCTUnderlineStyleAttributeName value:[NSNumber numberWithInt:kCTUnderlineStyleSingle] range:range];
    // font
    [attString addAttribute:NSFontAttributeName value:font range:range];
    // color
    [attString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return attString;
}

@end


@implementation NSMutableAttributedString (pAtt)

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color
{
    [self addString:string font:font color:color underline:NO];
}

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color underline:(BOOL)isUnderLine
{
    [self addString:string font:font color:color bgColor:nil underline:isUnderLine];
}

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color bgColor:(COLOR_CLASS * _Nullable)bgColor underline:(BOOL)isUnderLine
{
    if (!string) {
        return;
    }
    NSRange range = NSMakeRange(0, string.length);
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    if (isUnderLine) {
        // 下划线
        [attString addAttribute:(NSString*)kCTUnderlineStyleAttributeName value:[NSNumber numberWithInt:kCTUnderlineStyleSingle] range:range];
    }
    if (font) {
        [attString addAttribute:NSFontAttributeName value:font range:range];
    }
    if (color) {
        [attString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    if (bgColor) {
        [attString addAttribute:NSBackgroundColorAttributeName value:bgColor range:range];
    }
    
    [self appendAttributedString:attString];
}

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color bgColor:(COLOR_CLASS * _Nullable)bgColor underline:(BOOL)isUnderLine lineSpacing:(float)lineSpacing textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    if (!string) {
        return;
    }
    NSRange range = NSMakeRange(0, string.length);
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    if (isUnderLine) {
        // 下划线
        [attString addAttribute:(NSString*)kCTUnderlineStyleAttributeName value:[NSNumber numberWithInt:kCTUnderlineStyleSingle] range:range];
    }
    if (font) {
        [attString addAttribute:NSFontAttributeName value:font range:range];
    }
    if (color) {
        [attString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    if (bgColor) {
        [attString addAttribute:NSBackgroundColorAttributeName value:bgColor range:range];
    }
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    if (lineSpacing>-1) {
        paragraphStyle.lineSpacing = lineSpacing;
        [attString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    }
    
    [paragraphStyle setAlignment:textAlignment];
    [paragraphStyle setLineBreakMode:lineBreakMode];
    
    [self appendAttributedString:attString];
}

// 用于纠正不同字体之间的文字,不会行居中的问题,用于•
- (void)setBaselineOffsetMaxFont:(float)maxFont miniFont:(float)miniFont range:(NSRange)range
{
    [self addAttribute:NSBaselineOffsetAttributeName value:@(0.36 * (maxFont - miniFont)) range:range];
}

- (void)setBaselineOffsetMaxFont:(float)maxFont miniFont:(float)miniFont range:(NSRange)range scale:(float)scale
{
    [self addAttribute:NSBaselineOffsetAttributeName value:@(scale * (maxFont - miniFont)) range:range];
}

#pragma mark - Size Department
- (CGSize)sizeWithWidth:(CGFloat)width {
    // UI系列
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine context:nil].size;
    
    // NS系列
#elif TARGET_OS_MAC
    if (@available(macOS 10.11, *)) {
        return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine context:nil].size;
    } else {
        NSLog(@"10.11之前的系统不支持该方法: %s", __func__);
        return CGSizeZero;
    }
    
#endif

}

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
+ (NSMutableAttributedString *)separateText:(NSString *)text bigGap:(int)bigGap smallGap:(int)smallGap separateNumberArray:(NSArray *)separateNumberArray {
    if (text.length <= 0) {
        return [NSMutableAttributedString new];
    }
    if (bigGap <= 0) {
        bigGap = 6;
    }
    if (smallGap < 0) {
        smallGap = 0;
    }
    NSMutableAttributedString * att = [[NSMutableAttributedString alloc] initWithString:text];
    CFNumberRef numSmallGap         = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &smallGap);
    CFNumberRef numBigGap           = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &bigGap);
    
    //    int lastNumber = 0;
    //    for (NSNumber * number in separateNumberArray) {
    //        for (int i = lastNumber; i<=number.intValue && i<text.length; i++) {
    //            if (i == number.intValue) {
    //                [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numBigGap range:NSMakeRange(i, 1)];
    //            } else {
    //                [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numSmallGap range:NSMakeRange(i, 1)];
    //            }
    //        }
    //        lastNumber = number.intValue+1;
    //        if (number.intValue >= text.length) {
    //            break;
    //        }
    //    }
    
    [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numSmallGap range:NSMakeRange(0, text.length)];
    for (NSNumber * number in separateNumberArray) {
        if (number.intValue < text.length) {
            [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numBigGap range:NSMakeRange(number.intValue, 1)];
        }
    }
    
    CFRelease(numSmallGap);
    CFRelease(numBigGap);
    
    return att;
}

/**
*  普通信息
*
*  @param text 文本
*  @param bigGap 大间隔宽度,默认为6
*  @param smallGap 大间隔宽度,默认为0
*  @param separateNumber 间隔分割间隔, 默认为4, 针对银行卡号
*/
+ (NSMutableAttributedString *)separateText:(NSString *)text bigGap:(int)bigGap smallGap:(int)smallGap separateNumber:(int)separateNumber {
    if (text.length <= 0) {
        return [NSMutableAttributedString new];
    }
    if (bigGap <= 0) {
        bigGap = 6;
    }
    if (smallGap < 0) {
        smallGap = 0;
    }
    if (separateNumber == 0) {
        separateNumber = 4;
    }
    NSMutableAttributedString * att = [[NSMutableAttributedString alloc] initWithString:text];
    CFNumberRef numSmallGap         = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &smallGap);
    CFNumberRef numBigGap           = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &bigGap);
    
    [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numSmallGap range:NSMakeRange(0, text.length)];
    for (int i = separateNumber-1; i<text.length; i = i+separateNumber ) {
        [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numBigGap range:NSMakeRange(i, 1)];
    }
    
    CFRelease(numSmallGap);
    CFRelease(numBigGap);
    
    return att;
}

/**
*  金钱信息
*
*  @param text 文本
*  @param bigGap 大间隔宽度,默认为6
*  @param smallGap 大间隔宽度,默认为0
*  @param separateNumber 间隔分割间隔, 默认为4, 针对中国数字习惯
*/
+ (NSMutableAttributedString *)separateMoneyText:(NSString *)text bigGap:(int)bigGap smallGap:(int)smallGap separateNumber:(int)separateNumber {
    if (text.length <= 0) {
        return [NSMutableAttributedString new];
    }
    if (bigGap <= 0) {
        bigGap = 6;
    }
    if (smallGap < 0) {
        smallGap = 0;
    }
    if (separateNumber == 0) {
        separateNumber = 4;
    }
    
    // 纠正异常金钱值
    if ([text hasPrefix:@"0"] && text.length != 1){
        NSString * temp = [text replaceWithREG:@"^0+" newString:@""];
        if (temp.length == 0) {
            text = @"0";
        }else{
            text = temp;
        }
    }
    
    if ([text hasPrefix:@"."]) {
        text = [NSString stringWithFormat:@"0%@", text];
    }
    
    NSMutableAttributedString * att = [[NSMutableAttributedString alloc] initWithString:text];
    CFNumberRef numSmallGap         = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &smallGap);
    CFNumberRef numBigGap           = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &bigGap);
    
    NSString * textIntPart          = [text stringWithREG:@"\\d+"]; // 去除整数部分
    int loopCountInt                = (int)(textIntPart.length-1)/(separateNumber);
    
    [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numSmallGap range:NSMakeRange(0, text.length)];
    for (int i = 0; i < loopCountInt; i++) {
        NSInteger location = textIntPart.length - separateNumber*i -1 - separateNumber;
        if (location >= 0) {
            [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numBigGap range:NSMakeRange(location, 1)];
        }
    }
    
    CFRelease(numSmallGap);
    CFRelease(numBigGap);
    
    return att;
}

@end


