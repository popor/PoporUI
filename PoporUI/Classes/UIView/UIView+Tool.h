//
//  UIView+animation.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Tool)

#pragma mark 自带延迟效果的remove函数,防止自己销毁自己出错的情况.
+ (void)removeDestroyView:(UIView *)oneView;

@end
