//
//  UITableView+AllowPanGR.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UITableView+AllowPanGR.h"

@implementation UITableView (AllowPanGR)


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 模仿《网易云阅读》效果
    // 前提条件
    // self.commentSV.directionalLockEnabled = YES;
    // self.commentSV.bounces				  = NO;
    
    if ([otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] ) {
        return YES;
    }else{
        return NO;
    }
    // 网络上关于ios原生侧滑的代码
    //    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]
    //        && [otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
    //        return YES;
    //    } else {
    //        return  NO;
    //    }
    
}

@end
