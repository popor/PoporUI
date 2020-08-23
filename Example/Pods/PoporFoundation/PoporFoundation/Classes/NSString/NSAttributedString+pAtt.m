//
//  NSAttributedString+pAtt.m
//  Pods-PoporFoundation_Example
//
//  Created by popor on 2020/8/23.
//

#import "NSAttributedString+pAtt.h"

@implementation NSAttributedString (pAtt)

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

@end
