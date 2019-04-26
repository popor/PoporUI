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

// 针对 navigationBar.translucent 获取view 的 subview.y 的起始值.
- (int)getTopMargin;

@end

NS_ASSUME_NONNULL_END
