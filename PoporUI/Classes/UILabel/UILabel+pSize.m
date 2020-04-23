//
//  UILabel+pSize.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//
#import "UILabel+pSize.h"
#import "NSString+pSize.h"
#import "UIView+pExtension.h"

@implementation UILabel (pSize)

- (void)updateSize {
    [self setSizeStr:self.text font:self.font width:self.frame.size.width];
}

- (void)setSizeStr:(NSString *)text {
    [self setSizeStr:text font:self.font width:self.frame.size.width];
}

- (void)setSizeStr:(NSString *)text font:(UIFont *)font {
    [self setSizeStr:text font:font width:self.frame.size.width];
}

- (void)setSizeStr:(NSString *)text font:(UIFont *)font width:(CGFloat)width {
    if (!text) {
        return;
    }
    self.numberOfLines = 0;
    CGSize size = [text sizeInFont:font width:width];
    self.frame  = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
    self.text   = text;
    self.font   = font;
}

- (void)setSizeStr:(NSString *)text font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing width:(CGFloat)width {
    if (!text) {
        return;
    }
    if (!font) {
        font = self.font;
    }
    if (!color) {
        color = self.textColor;
    }
    
    NSRange range = (NSRange){0, text.length};
    NSMutableAttributedString * att;
    
    att = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [att addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];

    [att addAttribute:NSFontAttributeName value:font range:range];
    
    [att addAttribute:NSForegroundColorAttributeName value:color  range:range];
    
    [self setSizeATT:att width:width];
}

- (void)setSizeATT:(NSMutableAttributedString *)att {
    [self setSizeATT:att width:self.frame.size.width];
}

- (void)setSizeATT:(NSMutableAttributedString *)att width:(CGFloat)width {
    self.numberOfLines=0;
    [self setAttributedText:att];
    self.lineBreakMode = NSLineBreakByCharWrapping;
    
    CGRect rect = [att boundingRectWithSize:CGSizeMake(width, 100000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    self.height = rect.size.height;
}




@end
