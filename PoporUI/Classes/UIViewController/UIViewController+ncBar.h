//
//  UIViewController+ncBar.h
//  AppStore
//
//  Created by VRSEEN on 2017/7/6.
//  Copyright © 2017年 VRSeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ncBar)

@property (nonatomic, strong) NSNumber * needHiddenNVBar;// 隐藏导航栏的视图
//@property (nonatomic, getter=isInNC) BOOL inNC; // 是否在nc队列中

- (BOOL)isInNC;

@end
