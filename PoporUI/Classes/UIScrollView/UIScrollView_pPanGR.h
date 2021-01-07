//
//  UIScrollView_pPanGR.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIScrollView_pPanGR;
typedef UIView * (^UIScrollView_pPanGR_hitTestBlock) (UIScrollView_pPanGR * sv, CGPoint point, UIEvent * event);

// 模仿《网易云阅读》效果, 需要配合UISwipeNC一起使用
@interface UIScrollView_pPanGR : UIScrollView


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
@property (nonatomic, copy  ) UIScrollView_pPanGR_hitTestBlock hitTestBlock;

- (UIView *)inner_hitTest:(CGPoint)point withEvent:(UIEvent *)event;

@end
