//
//  UIScrollView+pHitTest.m
//  PoporUI
//
//  Created by popor on 2021/1/16.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIScrollView+pHitTest.h"
#import "NSObject+pSwizzling.h"

@implementation UIScrollView (pHitTest)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("UIScrollView") methodSwizzlingWithOriginalSelector:@selector(hitTest:withEvent:) bySwizzledSelector:@selector(pHitTest:withEvent:)];
    });
}

#pragma mark - 自定义hitTest
- (UIView *)pHitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hitTestBlock) {
        return self.hitTestBlock(self, point, event);
    } else {
        return [self pHitTest:point withEvent:event];
    }
}

- (UIView *)inner_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return [self pHitTest:point withEvent:event];
}


#pragma mark - 模拟sv惯性滑动
- (void)scrollWithVelocity:(CGPoint)velocity horizon:(BOOL)horizon {
    [self scrollWithVelocity:velocity horizon:horizon duration:0 velocityScale:0 springVelocity:0];
}

- (void)scrollWithVelocity:(CGPoint)velocity
                   horizon:(BOOL)horizon
                  duration:(CGFloat)duration
             velocityScale:(CGFloat)velocityScale
            springVelocity:(CGFloat)springVelocity
{
    [self scrollWithVelocity:velocity horizon:horizon duration:0 velocityScale:0 springVelocity:0 controlMax:YES controlMin:YES];
}

- (void)scrollWithVelocity:(CGPoint)velocity
                   horizon:(BOOL)horizon
                  duration:(CGFloat)duration
             velocityScale:(CGFloat)velocityScale
            springVelocity:(CGFloat)springVelocity
                controlMax:(BOOL)controlMax
                controlMin:(BOOL)controlMin
{
    if (duration <= 0) {
        duration = 1.5;
    }
    if (velocityScale <= 0) {
        velocityScale = 200;
    }
    if (springVelocity <= 0) {
        springVelocity = 3.4;
    }
    
    UIScrollView * sv = self;
    if (horizon) { // 水平
        if (velocity.x == 0) {
            return;
        } else {
            CGFloat offsetX;
            offsetX = velocity.x *velocityScale;
            offsetX = sv.contentOffset.x +offsetX;
            
            if (controlMax) {
                offsetX = MAX(offsetX, -sv.contentInset.left);
            }
            if (controlMin) {
                offsetX = MIN(offsetX, sv.contentSize.width +sv.contentInset.left +sv.contentInset.right);
            }
            
            [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:1 initialSpringVelocity:fabs(velocity.x)*springVelocity options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction animations:^{
                
                sv.contentOffset = CGPointMake(offsetX, sv.contentOffset.y);
            } completion:nil];
        }
    } else { // 垂直
        if (velocity.y == 0) {
            return;
        } else {
            CGFloat offsetY;
            offsetY = velocity.y *velocityScale;
            offsetY = sv.contentOffset.y +offsetY;
            
            if (controlMax) {
                offsetY = MAX(offsetY, -sv.contentInset.top);
            }
            if (controlMin) {
                offsetY = MIN(offsetY, sv.contentSize.height +sv.contentInset.top +sv.contentInset.bottom);
            }
            
            [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:1 initialSpringVelocity:fabs(velocity.y)*springVelocity options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction animations:^{
                
                sv.contentOffset = CGPointMake(sv.contentOffset.x, offsetY);
            } completion:nil];
        }
    }
    
}

#pragma mark - set get
- (void)setHitTestBlock:(UIScrollView_pHitTestBlock)hitTestBlock {
    objc_setAssociatedObject(self, @"hitTestBlock", hitTestBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIScrollView_pHitTestBlock)hitTestBlock {
    return objc_getAssociatedObject(self, @"hitTestBlock");
}

@end
