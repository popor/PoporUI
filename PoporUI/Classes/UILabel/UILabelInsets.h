//
//  UIUIInsetsLabel.h
//  Wanzi
//
//  Created by 王凯庆 on 2017/1/6.
//  Copyright © 2017年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabelInsets : UILabel

@property(nonatomic) UIEdgeInsets insets;

- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets) insets;
- (id)initWithInsets:(UIEdgeInsets) insets;

@end
