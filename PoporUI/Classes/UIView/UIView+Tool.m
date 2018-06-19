//
//  UIView+animation.m
//  Wanzi
//
//  Created by 王凯庆 on 2017/1/9.
//  Copyright © 2017年 wanzi. All rights reserved.
//

#import "UIView+Tool.h"

@implementation UIView (Tool)

#pragma mark 自带延迟效果的remove函数,防止自己销毁自己出错的情况.
+ (void)removeDestroyView:(UIView *)oneView
{
    __block UIView * weakView = oneView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [oneView removeFromSuperview];
        weakView = nil;
    });
}
@end
