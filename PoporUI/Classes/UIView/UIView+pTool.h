//
//  UIView+pTool.h
//  PoporUI
//
//  Created by popor on 2021/2/20.
//  Copyright © 2021年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (pTool)

- (void)cleanSelf;
- (void)cleanSelfDelay:(CGFloat)delay;

// 增加UI检查Views
- (void)addCheckerViewsVertical:(NSArray *)heightArray;
- (void)addCheckerViewsVertical:(NSArray *)heightArray colorArray:(NSArray * _Nullable)colorArray;

- (void)addCheckerViewsHorizon:(NSArray *)widthArray;
- (void)addCheckerViewsHorizon:(NSArray *)widthArray colorArray:(NSArray * _Nullable)colorArray;


@end
