//
//  UINavigationController+Size.h
//  Pods-PoporUI_Example
//
//  Created by apple on 2019/2/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Size)

@property (nonatomic) int topMargin;// 隐藏导航栏的视图

@property (nonatomic) BOOL _initTopMargin; // 内部使用

@end

NS_ASSUME_NONNULL_END
