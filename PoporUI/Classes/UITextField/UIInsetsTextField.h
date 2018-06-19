//
//  UIInsetsTextField.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIInsetsTextField : UITextField

@property (nonatomic) UIEdgeInsets insets;

- (id)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets;

- (CGRect)textRectForBounds:(CGRect)bounds;
- (CGRect)editingRectForBounds:(CGRect)bounds;
@end
