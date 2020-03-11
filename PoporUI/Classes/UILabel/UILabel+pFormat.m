//
//  UILabel+pFormat.m
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import "UILabel+pFormat.h"
#import <CoreText/CoreText.h>
#import <PoporFoundation/NSString+pTool.h>
#import <PoporFoundation/NSString+pAtt.h>

@implementation UILabel (pFormat)

// 中国的电话
- (void)formatChinaPhone {
    [self formatChinaPhoneGapWidth:6];
}

- (void)formatChinaPhoneGapWidth:(int)gapWidth {
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumberArray:@[@2, @6, @10]];
    self.attributedText = att;
}

// 中国身份证
- (void)formatChinaIdcard {
    [self formatChinaIdcardGapWidth:6];
}

- (void)formatChinaIdcardGapWidth:(int)gapWidth {
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumberArray:@[@5, @9, @13, @17]];
    self.attributedText = att;
}

// money
- (void)formatMoneyUnit:(int)unit {
    [self formatMoneyUnit:unit gapWitdh:6];
}

- (void)formatMoneyUnit:(int)unit gapWitdh:(int)gapWidth {
    NSMutableAttributedString * att = [NSMutableAttributedString separateMoneyText:self.text bigGap:gapWidth smallGap:0 separateNumber:unit];
    self.attributedText = att;
}

- (void)formatBankUnit:(int)unit {
    [self formatBankUnit:unit gapWitdh:6];
}

- (void)formatBankUnit:(int)unit gapWitdh:(int)gapWidth {
    NSMutableAttributedString * att = [NSMutableAttributedString separateText:self.text bigGap:gapWidth smallGap:0 separateNumber:unit];
    self.attributedText = att;
}


@end
