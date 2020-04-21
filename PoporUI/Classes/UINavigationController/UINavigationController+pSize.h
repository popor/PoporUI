//
//  UINavigationController+pSize.h
//  PoporUI
//
//  Created by apple on 2019/2/27.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (pSize)

@property (nonatomic) int barHeight;// 隐藏导航栏的视图

@property (nonatomic) BOOL _initBarHeight; // 内部使用


@end

NS_ASSUME_NONNULL_END
