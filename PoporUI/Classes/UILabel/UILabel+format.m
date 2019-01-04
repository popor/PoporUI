//
//  UILabel+format.m
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import "UILabel+format.h"
#import <CoreText/CoreText.h>
#import <PoporFoundation/NSString+Tool.h>

@implementation UILabel (format)

// 中国的电话
- (void)formatChinaPhone {
    [self formatChinaPhoneGapWidth:6];
}

- (void)formatChinaPhoneGapWidth:(int)gapWidth {
    UILabel * lable = self;
    if (lable.text.length == 0) {
        return;
    }
    if (gapWidth < 0) {
        gapWidth = 0;
    }
    
    NSString * text = lable.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        {
            long number = gapWidth; // gap宽度
            int length = 1;
            CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
            if (text.length > 3) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(2, length)];
            }
            if (text.length > 7) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(6, length)];
            }
            if (text.length > 11) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(10,length)];
            }
            
            CFRelease(num);
        }
        [lable setAttributedText:attributedString];
    }
}

// money
- (void)formatMoneyUnit:(int)unit {
    [self formatMoneyUnit:unit gapWitdh:6];
}

- (void)formatMoneyUnit:(int)unit gapWitdh:(int)gapWidth {
    UILabel * lable = self;
    if (lable.text.length == 0) {
        return;
    }
    if (unit < 0) {
        return;
    }
    if (gapWidth < 0) {
        gapWidth = 0;
    }
    
    if ([lable.text hasPrefix:@"0"] && lable.text.length != 1){
        NSString * text = [lable.text replaceWithREG:@"^0+" newString:@""];
        if (text.length == 0) {
            lable.text = @"0";
        }else{
            lable.text = text;
        }
    }
    
    if ([lable.text hasPrefix:@"."]) {
        lable.text = [NSString stringWithFormat:@"0%@", lable.text];
    }
    
    NSString * text = lable.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        long number      = gapWidth; // gap宽度
        int length       = 1;
        //int unit         = 4;
        CFNumberRef num  = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
        
        NSString * textIntPart = [text stringWithREG:@"\\d+"]; // 去除整数部分
        int loopCountInt    = (int)(textIntPart.length-1)/(unit);
        int loopCountOrigin = (int)(text.length-1)/(unit);
        
        for (int i = 0, j=loopCountOrigin-1; i < loopCountInt; i++, j--) {
            NSInteger location = textIntPart.length - unit*i -1 - unit;
            NSRange attRange = NSMakeRange(location, length);
            if (location >= 0) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:attRange];
            }
        }
        
        CFRelease(num);
        [lable setAttributedText:attributedString];
    }
}

- (void)formatBankUnit:(int)unit {
    [self formatBankUnit:unit gapWitdh:6];
}

- (void)formatBankUnit:(int)unit gapWitdh:(int)gapWidth {
    UILabel * lable = self;
    if (lable.text.length == 0) {
        return;
    }
    if (unit < 0) {
        return;
    }
    if (gapWidth < 0) {
        gapWidth = 0;
    }
    
    NSString * text = lable.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        {
            long number      = gapWidth; // gap宽度
            int length       = 1;
            CFNumberRef num  = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
            int loopCountInt = (int)(lable.text.length-1)/(unit);
            
            for (int i = 0; i<loopCountInt; i++) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(unit*(i+1)-1, length)];
            }
            
            CFRelease(num);
        }
        [lable setAttributedText:attributedString];
    }
}


@end
