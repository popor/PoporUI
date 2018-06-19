//
//  UIViewController+ncBar.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ncBar)

@property (nonatomic, strong) NSNumber * needHiddenNVBar;// 隐藏导航栏的视图
//@property (nonatomic, getter=isInNC) BOOL inNC; // 是否在nc队列中

- (BOOL)isInNC;

@end
