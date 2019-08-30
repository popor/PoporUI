//
//  UIScrollView+pTool.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIScrollView+pTool.h"

/// 获取UIEdgeInsets在垂直方向上的值
CG_INLINE CGFloat
UIEdgeInsetsGetVerticalValue(UIEdgeInsets insets) {
    return insets.top + insets.bottom;
}

/// 获取UIEdgeInsets在水平方向上的值
CG_INLINE CGFloat
UIEdgeInsetsGetHorizontalValue(UIEdgeInsets insets) {
    return insets.left + insets.right;
}

@implementation UIScrollView (tool)

- (void)scrollToBottomAnimated:(BOOL)animated {
    if ([self qmui_canScroll]) {
        [self setContentOffset:CGPointMake(self.contentOffset.x, self.contentSize.height + self.qmui_contentInset.bottom - CGRectGetHeight(self.bounds)) animated:animated];
    }
}

- (BOOL)qmui_canScroll {
    // 没有高度就不用算了，肯定不可滚动，这里只是做个保护
    if (self.bounds.size.height == 0) {
        return NO;
    }
    BOOL canVerticalScroll = self.contentSize.height + UIEdgeInsetsGetVerticalValue(self.qmui_contentInset) > CGRectGetHeight(self.bounds);
    BOOL canHorizontalScoll = self.contentSize.width + UIEdgeInsetsGetHorizontalValue(self.qmui_contentInset) > CGRectGetWidth(self.bounds);
    return canVerticalScroll || canHorizontalScoll;
}

- (UIEdgeInsets)qmui_contentInset {
    if (@available(iOS 11, *)) {
        return self.adjustedContentInset;
    } else {
        return self.contentInset;
    }
}

@end
