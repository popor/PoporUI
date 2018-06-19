//
//  UIScrollView+AllowPanGRPass.m
//  WanziTG
//
//  Created by popor on 16/3/28.
//  Copyright © 2016年 wanzi. All rights reserved.
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
