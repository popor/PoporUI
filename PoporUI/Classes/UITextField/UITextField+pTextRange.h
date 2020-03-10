//
//  UITextField+pTextRange.h
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (pTextRange)

- (NSRange)selectedRange;

// 备注：UITextField必须为第一响应者才有效
- (void)setSelectedRange:(NSRange) range;

@end
