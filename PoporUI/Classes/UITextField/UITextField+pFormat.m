//
//  UITextField+pFormat.m
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import "UITextField+pFormat.h"
#import "UITextField+pTextRange.h"
#import <CoreText/CoreText.h>
#import <PoporFoundation/NSString+pTool.h>
#import <PoporFoundation/NSMutableAttributedString+pAtt.h>

@implementation UITextField (pFormat)

// 中国的电话
- (void)formatChinaPhone {
    [self formatChinaPhoneGapWidth:6];
}

- (void)formatChinaPhoneGapWidth:(NSInteger)gapWidth {
    UITextRange *selectedTextRange = self.selectedTextRange;
    
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumberArray:@[@2, @6, @10]];
    self.attributedText = att;
    
    self.selectedTextRange = selectedTextRange;
}

// 中国的省份证号
- (void)formatChinaIdcard {
    [self formatChinaIdcardGapWidth:6];
}

- (void)formatChinaIdcardGapWidth:(NSInteger)gapWidth {
    UITextRange *selectedTextRange = self.selectedTextRange;
    
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumberArray:@[@5, @9, @13, @17]];
    self.attributedText = att;
    
    self.selectedTextRange = selectedTextRange;
}

// money
- (void)formatMoneyUnit:(NSInteger)unit {
    [self formatMoneyUnit:unit gapWitdh:6];
}

- (void)formatMoneyUnit:(NSInteger)unit gapWitdh:(NSInteger)gapWidth {
    UITextRange *selectedTextRange = self.selectedTextRange;
    
    NSString * originText = self.text;
    NSMutableAttributedString * att = [NSMutableAttributedString separateMoneyText:self.text bigGap:gapWidth smallGap:0 separateNumber:unit];
    self.attributedText = att;
    
    if ([originText hasPrefix:@"."]) { // 假如原文是.开头的, 那么会变为0. 那么此时主动修改selectedTextRange
        if (selectedTextRange.isEmpty) {
            UITextPosition *beginning = self.beginningOfDocument;
            UITextPosition *start     = [self positionFromPosition:beginning offset:2];
            selectedTextRange    = [self textRangeFromPosition:start toPosition:start];
        } else {
            
        }
    }
    
    self.selectedTextRange = selectedTextRange;
}

- (void)formatBankUnit:(NSInteger)unit {
    [self formatBankUnit:unit gapWitdh:6];
}

- (void)formatBankUnit:(NSInteger)unit gapWitdh:(NSInteger)gapWidth {
    UITextRange *selectedTextRange = self.selectedTextRange;
    
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumber:unit];
    self.attributedText = att;
    
    self.selectedTextRange = selectedTextRange;
}


@end
