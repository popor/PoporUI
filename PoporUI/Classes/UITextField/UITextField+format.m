//
//  UITextField+format.m
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import "UITextField+format.h"
#import "UITextField+selection.h"
#import <CoreText/CoreText.h>
#import <PoporFoundation/NSString+Tool.h>

@implementation UITextField (format)

// 中国的电话
- (void)formatChinaPhone {
    UITextField * textField = self;
    UITextRange *selectedTextRange = textField.selectedTextRange;
    
    NSString * text = textField.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        {
            long number = 6; // gap宽度
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
        [textField setAttributedText:attributedString];
    }
    
    [textField setSelectedTextRange:selectedTextRange];
}

// money
- (void)formatMoneyUnit:(int)unit {
    if (unit <= 0) {
        return;
    }
    UITextField * textField = self;
    if (textField.text.length == 0) {
        return;
    }
    if ([textField.text hasPrefix:@"0"] && textField.text.length != 1){
        NSString * text = [textField.text replaceWithREG:@"^0+" newString:@""];
        if (text.length == 0) {
            textField.text = @"0";
        }else{
            textField.text = text;
        }
    }
    
    if ([textField.text hasPrefix:@"."] && textField.selectedRange.location != 0) {
        textField.text = [NSString stringWithFormat:@"0%@", textField.text];
    }
    
    UITextRange *selectedTextRange = textField.selectedTextRange;
    
    NSString * text = textField.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        long number      = 6; // gap宽度
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
        [textField setAttributedText:attributedString];
    }
    
    [textField setSelectedTextRange:selectedTextRange];
}


@end
