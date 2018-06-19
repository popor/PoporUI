//
//  UIInsetsTextField.h
//  Wanzi
//
//  Created by 王凯庆 on 2017/1/6.
//  Copyright © 2017年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIInsetsTextField : UITextField

@property (nonatomic) UIEdgeInsets insets;

- (id)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets;

- (CGRect)textRectForBounds:(CGRect)bounds;
- (CGRect)editingRectForBounds:(CGRect)bounds;
@end
