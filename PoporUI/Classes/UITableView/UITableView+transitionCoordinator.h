//
//  UITableView+transitionCoordinator.h
//  PoporUI
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (transitionCoordinator)

/*
 缓慢侧滑的时候,cell缓慢变色的特效,可以查看系统设置效果.
 借鉴于: https://juejin.im/post/5c26dfe851882561431a4927
 https://github.com/popor/DeselectRowTheBestWay
 
//*/
- (void)transitionCoordinator:(id <UIViewControllerTransitionCoordinator>)transitionCoordinator animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
