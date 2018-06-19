//
//  UIView+animation.h
//  Wanzi
//
//  Created by 王凯庆 on 2017/1/9.
//  Copyright © 2017年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Tool)

#pragma mark 自带延迟效果的remove函数,防止自己销毁自己出错的情况.
+ (void)removeDestroyView:(UIView *)oneView;

@end
