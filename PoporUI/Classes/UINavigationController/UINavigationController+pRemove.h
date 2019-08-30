//
//  UINavigationController+pRemove.h
//  PoporUI
//
//  Created by apple on 2018/9/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (pRemove)

- (void)removeVcClass:(Class)vcClass animated:(BOOL)animated;

/*
 index 如果是正数就从0开始,负数倒序开始.
 正:从0开始
 负:从-1开始
 */
- (void)removeIndex:(NSInteger)index animated:(BOOL)animated;

@end
