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

// https://blog.csdn.net/zhaotao0617/article/details/86672383
// 可用于排查和其他class冲突, 例如sv 上面的 tv.cell 侧滑事件
//sv.hitTestBlock = ^UIView *(UIScrollView_pPanGR *sv, CGPoint point, UIEvent *event) {
//    UIView *view = [sv inner_hitTest:point withEvent:event];
//    if ([view.superview isMemberOfClass:[JobFavCellJob class]]
//        || [view.superview isMemberOfClass:[JobFavCellCorp class]]
//        ){
//        sv.scrollEnabled = NO;
//    }else{
//        sv.scrollEnabled = YES;
//    }
//    return view;
//};
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hitTestBlock) {
        return self.hitTestBlock(self, point, event);
    } else {
        return [super hitTest:point withEvent:event];
    }
}

- (UIView *)inner_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return [super hitTest:point withEvent:event];
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
