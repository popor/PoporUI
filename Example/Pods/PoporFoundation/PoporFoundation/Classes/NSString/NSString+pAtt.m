//
//  NSString+pAtt.m
//  PoporFoundation
//
//  Created by popor on 2016/11/8.
//  Copyright © 2016年 popor. All rights reserved.
//

#import "NSString+pAtt.h"
#import <CoreText/CoreText.h>

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


