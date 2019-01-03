//
//  UITextField+format.h
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (format)

// 中国的电话, 格式为3|4|4
- (void)formatChinaPhone;

// money, unit 一般为3或者4
- (void)formatMoneyUnit:(int)unit;

@end
