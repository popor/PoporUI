//
//  UIInsetsTextField.m
//  Wanzi
//
//  Created by 王凯庆 on 2017/1/6.
//  Copyright © 2017年 wanzi. All rights reserved.
//

#import "UIInsetsTextField.h"

@implementation UIInsetsTextField

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.insets = UIEdgeInsetsMake(0, 10, 0, 10);
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame insets:(UIEdgeInsets)insets;
{
    if (self = [super initWithFrame:frame]) {
        self.insets = insets;
    }
    return self;
}
//控制文本所在的的位置，左右缩 10
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect(bounds, self.insets);
}

//控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect(bounds, self.insets);
}

@end
