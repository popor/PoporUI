//
//  UIScrollView_pPanGR.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIScrollView_pPanGR.h"

@implementation UIScrollView_pPanGR

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.directionalLockEnabled = YES;
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        self.directionalLockEnabled = YES;
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // 前提条件
    // self.commentSV.directionalLockEnabled = YES;
    
    if ([otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] ) {
        return YES;
    }else{
        return NO;
    }
}

@end
