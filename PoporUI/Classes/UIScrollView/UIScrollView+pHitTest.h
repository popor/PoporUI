//
//  UIScrollView+pHitTest.h
//  PoporUI
//
//  Created by popor on 2021/1/16.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 包含hitTest, Simultaneously(近似手势), 模拟惯性滑动.
 */

typedef UIView * (^UIScrollView_pHitTestBlock) (UIScrollView * sv, CGPoint point, UIEvent * event);

typedef BOOL (^UIScrollView_pSimultaneouslyBlock) (UIScrollView * sv, UIGestureRecognizer * gestureRecognizer, UIGestureRecognizer * otherGestureRecognizer);

@interface UIScrollView (pHitTest)

#pragma mark - 自定义hitTest
// https://blog.csdn.net/zhaotao0617/article/details/86672383
// 可用于排查和其他class冲突, 例如sv 上面的 tv.cell 侧滑事件
// 具体方法
//sv.hitTestBlock = ^UIView *(UIScrollView_pPanGR *sv, CGPoint point, UIEvent *event) {
//    UIView *view = [sv inner_hitTest:point withEvent:event];
//    if ([view.superview isMemberOfClass:[JobFavCellJob class]]
//        || [view.superview isMemberOfClass:[JobFavCellCorp class]]
//        || [view.superview isMemberOfClass:NSClassFromString(@"UITableViewCellContentView")]
//        ){
//        sv.scrollEnabled = NO;
//    }else{
//        sv.scrollEnabled = YES;
//    }
//    return view;
//};
@property (nonatomic, copy  ) UIScrollView_pHitTestBlock hitTestBlock;

- (UIView *)inner_hitTest:(CGPoint)point withEvent:(UIEvent *)event;


#pragma mark - 自定义Simultaneously

/*
 1. 假如想区分滑动和屏幕侧滑区分开, 需要设置:
 [sv.panGestureRecognizer requireGestureRecognizerToFail: nc.interactivePopGestureRecognizer];
 
 */


#pragma mark - 模拟sv惯性滑动
/**
 *  @brief 这个可以模拟SV的滑动事件. 通常用于:
 - (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
 , 当修改了SV的滚动事件时候, 可以这个函数里面, 重新把滚动UI继续起来.
 *
 *  @param horizon        水平还是垂直方向
 *
 **/
- (void)scrollWithVelocity:(CGPoint)velocity horizon:(BOOL)horizon;

/**
 *  @brief 这个可以模拟SV的滑动事件. 通常用于:
 - (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
 , 当修改了SV的滚动事件时候, 可以这个函数里面, 重新把滚动UI继续起来.
 *
 *
 *  @param horizon        水平还是垂直方向
 *  @param duration       默认为1.5秒
 *  @param velocityScale  默认为200
 *  @param springVelocity 默认为3.4
 */
- (void)scrollWithVelocity:(CGPoint)velocity
                   horizon:(BOOL)horizon
                  duration:(CGFloat)duration
             velocityScale:(CGFloat)velocityScale
            springVelocity:(CGFloat)springVelocity;

/**
 *  @brief 这个可以模拟SV的滑动事件. 通常用于:
 - (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
 , 当修改了SV的滚动事件时候, 可以这个函数里面, 重新把滚动UI继续起来.
 *
 *
 *  @param horizon        水平还是垂直方向
 *  @param duration       默认为1.5秒
 *  @param velocityScale  默认为200
 *  @param springVelocity 默认为3.4
 *  @param controlMax     假如只控制自己, 可以设置为YES, 假如有多级联动动画, 推荐为NO.
 *  @param controlMin     假如只控制自己, 可以设置为YES, 假如有多级联动动画, 推荐为NO.
 */
- (void)scrollWithVelocity:(CGPoint)velocity
                   horizon:(BOOL)horizon
                  duration:(CGFloat)duration
             velocityScale:(CGFloat)velocityScale
            springVelocity:(CGFloat)springVelocity
                controlMax:(BOOL)controlMax
                controlMin:(BOOL)controlMin;

@end
