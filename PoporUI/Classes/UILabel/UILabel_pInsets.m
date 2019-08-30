//
//  UILabel_pInsets.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UILabel_pInsets.h"

@implementation UILabel_pInsets

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
