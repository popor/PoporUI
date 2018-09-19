//
//  UINavigationController+remove.m
//  linRunShengPi
//
//  Created by apple on 2018/9/19.
//  Copyright © 2018年 艾慧勇. All rights reserved.
//

#import "UINavigationController+remove.h"

@implementation UINavigationController (remove)

- (void)removeVcClass:(Class)vcClass animated:(BOOL)animated {
    NSArray * vcArray = self.viewControllers;
    if (vcArray.count > 1) {
        BOOL find = NO;
        NSMutableArray * uArray = [NSMutableArray new];
        for (UIViewController * vc in vcArray) {
            if ([vc isKindOfClass:vcClass]) {
                find = YES;
            }else{
                [uArray addObject:vc];
            }
        }
        if (find) {
            [self setViewControllers:uArray animated:animated];
        }
    }
}

/*
 index 如果是正数就从0开始,负数倒序开始.
 正:从0开始
 负:从-1开始
 */
- (void)removeIndex:(NSInteger)index animated:(BOOL)animated {
    NSMutableArray * vcArray = [self.viewControllers mutableCopy];
    if (vcArray.count > 1) {
        if (index >= 0) {
            if (index < vcArray.count) {
                [vcArray removeObjectAtIndex:index];
                [self setViewControllers:vcArray animated:animated];
            }
        }else{
            if (-index <= vcArray.count) {
                [vcArray removeObjectAtIndex:vcArray.count + index];
                [self setViewControllers:vcArray animated:animated];
            }
        }
    }
}

@end
