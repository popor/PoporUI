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
#import <PoporFoundation/NSString+pAtt.h>

@implementation UITextField (pFormat)

// 中国的电话
- (void)formatChinaPhone {
    [self formatChinaPhoneGapWidth:6];
}

- (void)formatChinaPhoneGapWidth:(int)gapWidth {
    UITextRange *selectedTextRange = self.selectedTextRange;
    
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumberArray:@[@2, @6, @10]];
    self.attributedText = att;
    
    self.selectedTextRange = selectedTextRange;
}

// 中国的省份证号
- (void)formatChinaIdcard {
    [self formatChinaIdcardGapWidth:6];
}

- (void)formatChinaIdcardGapWidth:(int)gapWidth {
    UITextRange *selectedTextRange = self.selectedTextRange;
    
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumberArray:@[@5, @9, @13, @17]];
    self.attributedText = att;
    
    self.selectedTextRange = selectedTextRange;
}

// money
- (void)formatMoneyUnit:(int)unit {
    [self formatMoneyUnit:unit gapWitdh:6];
}

- (void)formatMoneyUnit:(int)unit gapWitdh:(int)gapWidth {
    UITextRange *selectedTextRange = self.selectedTextRange;
    
    NSMutableAttributedString * att = [NSMutableAttributedString separateMoneyText:self.text bigGap:gapWidth smallGap:0 separateNumber:unit];
    self.attributedText = att;
    
    self.selectedTextRange = selectedTextRange;
}

- (void)formatBankUnit:(int)unit {
    [self formatBankUnit:unit gapWitdh:6];
}

- (void)formatBankUnit:(int)unit gapWitdh:(int)gapWidth {
    UITextRange *selectedTextRange = self.selectedTextRange;
    
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumber:unit];
    self.attributedText = att;
    
    self.selectedTextRange = selectedTextRange;
}


@end
