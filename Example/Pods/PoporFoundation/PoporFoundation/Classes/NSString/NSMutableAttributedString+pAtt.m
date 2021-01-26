//
//  NSMutableAttributedString+pAtt.m
//  Pods-PoporFoundation_Example
//
//  Created by popor on 2020/8/23.
//

#import "NSMutableAttributedString+pAtt.h"
#import "NSString+pTool.h"

@implementation NSMutableAttributedString (pAtt)

#pragma mark - 常用函数
- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color
{
    [self addString:string font:font color:color underline:NO];
}

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color lineSpacing:(CGFloat)lineSpacing
{
    [self addString:string font:font color:color bgColor:nil underline:NO lineSpacing:lineSpacing textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByWordWrapping];
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

- (void)addString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color bgColor:(COLOR_CLASS * _Nullable)bgColor underline:(BOOL)isUnderLine lineSpacing:(CGFloat)lineSpacing textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode
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
    }
    
    [paragraphStyle setAlignment:textAlignment];
    [paragraphStyle setLineBreakMode:lineBreakMode];
    
    [attString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    [self appendAttributedString:attString];
}

- (void)addImage:(IMAGE_CLASS * _Nullable)image bounds:(CGRect)bounds {
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    
    // UI系列
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
    attach.image  = image; //设置图片
    attach.bounds = bounds; //设置图片大小、位置
    NSAttributedString * imageAtt = [NSAttributedString attributedStringWithAttachment:attach];
    [self appendAttributedString:imageAtt];
    // NS系列
#elif TARGET_OS_MAC
    if (@available(macOS 10.11, *)) {
        attach.image  = image; //设置图片
        attach.bounds = bounds; //设置图片大小、位置
        NSAttributedString * imageAtt = [NSAttributedString attributedStringWithAttachment:attach];
        
        [self appendAttributedString:imageAtt];
    } else {
        NSLog(@"PoporFoundation :%s , error: system version", __func__);
    }
#endif
}

// 用于纠正不同字体之间的文字,不会行居中的问题,用于•
- (void)setBaselineOffsetMaxFont:(CGFloat)maxFont miniFont:(CGFloat)miniFont range:(NSRange)range
{
    [self addAttribute:NSBaselineOffsetAttributeName value:@(0.36 * (maxFont - miniFont)) range:range];
}

- (void)setBaselineOffsetMaxFont:(CGFloat)maxFont miniFont:(CGFloat)miniFont range:(NSRange)range scale:(CGFloat)scale
{
    [self addAttribute:NSBaselineOffsetAttributeName value:@(scale * (maxFont - miniFont)) range:range];
}

#pragma mark - 常用函数的链式编程
+ (NSMutableAttributedString *(^)(NSString *))string {
    return ^NSMutableAttributedString *(NSString * string) {
        if (!string) {
            return nil;
        }
        
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
        return attString;
    };
}

- (NSMutableAttributedString *(^)(NSMutableAttributedString *))att {
    return ^NSMutableAttributedString *(NSMutableAttributedString * att) {
        if (att) {
            [self appendAttributedString:att];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(FONT_CLASS *))font {
    return ^NSMutableAttributedString *(FONT_CLASS * font) {
        if (font) {
            NSRange range = NSMakeRange(0, self.mutableString.length);
            [self addAttribute:NSFontAttributeName value:font range:range];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(COLOR_CLASS *))color {
    return ^NSMutableAttributedString *(COLOR_CLASS * color) {
        if (color) {
            NSRange range = NSMakeRange(0, self.mutableString.length);
            [self addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(COLOR_CLASS *))bgColor {
    return ^NSMutableAttributedString *(COLOR_CLASS * bgColor) {
        if (bgColor) {
            NSRange range = NSMakeRange(0, self.mutableString.length);
            [self addAttribute:NSBackgroundColorAttributeName value:bgColor range:range];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(BOOL))underLine {
    return ^NSMutableAttributedString *(BOOL underLine) {
        NSRange range = NSMakeRange(0, self.mutableString.length);
        if (underLine) {
            [self addAttribute:(NSString*)kCTUnderlineStyleAttributeName value:@(kCTUnderlineStyleSingle) range:range];
        } else {
            [self addAttribute:(NSString*)kCTUnderlineStyleAttributeName value:@(kCTUnderlineStyleNone) range:range];
        }
        return self;
    };
}

- (NSMutableAttributedString *(^)(CTUnderlineStyle))lineStyle {
    return ^NSMutableAttributedString *(CTUnderlineStyle lineStyle) {
        NSRange range = NSMakeRange(0, self.mutableString.length);
        [self addAttribute:(NSString*)kCTUnderlineStyleAttributeName value:@(lineStyle) range:range];
        return self;
    };
}

// 需要配合NSMutableParagraphStyle (pAtt)使用
- (NSMutableAttributedString *(^)(NSMutableParagraphStyle *))paraStyle {
    return ^NSMutableAttributedString *(NSMutableParagraphStyle * style) {
        if (style) {
            NSRange range = NSMakeRange(0, self.mutableString.length);
            [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
        }
        return self;
    };
}

#pragma mark - 文本之间空隙间隔
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
+ (NSMutableAttributedString *)separateText:(NSString *)text bigGap:(NSInteger)bigGap smallGap:(NSInteger)smallGap separateNumberArray:(NSArray *)separateNumberArray {
    if (text.length <= 0) {
        return [NSMutableAttributedString new];
    }
    if (bigGap < 0) {
        bigGap = 0;
    }
    if (smallGap < 0) {
        smallGap = 0;
    }
    NSMutableAttributedString * att = [[NSMutableAttributedString alloc] initWithString:text];
    CFNumberRef numSmallGap         = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &smallGap);
    CFNumberRef numBigGap           = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &bigGap);
    
    //    NSInteger lastNumber = 0;
    //    for (NSNumber * number in separateNumberArray) {
    //        for (NSInteger i = lastNumber; i<=number.intValue && i<text.length; i++) {
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
        if (number.intValue+1 < text.length) {
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
+ (NSMutableAttributedString *)separateText:(NSString *)text bigGap:(NSInteger)bigGap smallGap:(NSInteger)smallGap separateNumber:(NSInteger)separateNumber {
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
    for (NSInteger i = separateNumber-1; i<text.length; i = i+separateNumber ) {
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
+ (NSMutableAttributedString *)separateMoneyText:(NSString *)text bigGap:(NSInteger)bigGap smallGap:(NSInteger)smallGap separateNumber:(NSInteger)separateNumber {
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
    NSInteger loopCountInt          = (NSInteger)(textIntPart.length-1)/(separateNumber);
    
    [att addAttribute:(id)kCTKernAttributeName value:(__bridge id)numSmallGap range:NSMakeRange(0, text.length)];
    for (NSInteger i = 0; i < loopCountInt; i++) {
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
