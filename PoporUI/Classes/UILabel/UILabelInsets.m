//
//  UIUIInsetsLabel.m
//  Wanzi
//
//  Created by 王凯庆 on 2017/1/6.
//  Copyright © 2017年 wanzi. All rights reserved.
//

#import "UILabelInsets.h"

@implementation UILabelInsets

- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets {
    self = [super initWithFrame:frame];
    if(self) {
        self.insets = insets;
    }
    return self;
}

- (id)initWithInsets:(UIEdgeInsets)insets {
    self = [super init];
    if(self) {
        self.insets = insets;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
