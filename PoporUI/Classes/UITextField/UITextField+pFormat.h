//
//  UITextField+pFormat.h
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (pFormat)

// 中国的电话, 格式为3-4-4
- (void)formatChinaPhone;
- (void)formatChinaPhoneGapWidth:(int)gapWidth;

// money, unit 一般为3或者4
- (void)formatMoneyUnit:(int)unit;
- (void)formatMoneyUnit:(int)unit gapWitdh:(int)gapWidth;

// bank, unit 一般为4
- (void)formatBankUnit:(int)unit;
- (void)formatBankUnit:(int)unit gapWitdh:(int)gapWidth;

@end
