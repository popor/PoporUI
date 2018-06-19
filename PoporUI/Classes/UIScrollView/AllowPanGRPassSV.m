//
//  UIScrollView+AllowPanGRPass.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "AllowPanGRPassSV.h"

@implementation AllowPanGRPassSV

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.directionalLockEnabled = YES;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
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
