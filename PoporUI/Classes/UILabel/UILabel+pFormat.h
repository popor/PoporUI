//
//  UILabel+pFormat.h
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (pFormat)

// 中国的电话, 格式为3-4-4
- (void)formatChinaPhone;
- (void)formatChinaPhoneGapWidth:(NSInteger)gapWidth;

// 中国身份证
- (void)formatChinaIdcard;
- (void)formatChinaIdcardGapWidth:(NSInteger)gapWidth;

// money, unit 一般为3或者4
- (void)formatMoneyUnit:(NSInteger)unit;
- (void)formatMoneyUnit:(NSInteger)unit gapWitdh:(NSInteger)gapWidth;

// bank, unit 一般为4
- (void)formatBankUnit:(NSInteger)unit;
- (void)formatBankUnit:(NSInteger)unit gapWitdh:(NSInteger)gapWidth;

@end
