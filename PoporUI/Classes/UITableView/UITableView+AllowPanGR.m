//
//  UITableView+AllowPanGR.m
//  AppStore
//
//  Created by VRSEEN on 2017/7/28.
//  Copyright © 2017年 VRSeen. All rights reserved.
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
