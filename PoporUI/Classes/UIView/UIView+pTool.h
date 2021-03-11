//
//  UIView+pTool.h
//  PoporUI
//
//  Created by popor on 2021/2/20.
//  Copyright © 2021年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSInteger kCheckerViewTag_vertical = 99001;
static NSInteger kCheckerViewTag_horizon  = 99002;

@interface UIView (pTool)

- (void)cleanSelf;
- (void)cleanSelfDelay:(CGFloat)delay;

// 增加UI检查Views
- (void)addCheckerViewsVertical:(NSArray * _Nullable)heightArray;
- (void)addCheckerViewsVertical:(NSArray * _Nullable)heightArray colorArray:(NSArray * _Nullable)colorArray;

- (void)addCheckerViewsHorizon:(NSArray * _Nullable)widthArray;
- (void)addCheckerViewsHorizon:(NSArray * _Nullable)widthArray colorArray:(NSArray * _Nullable)colorArray lY:(CGFloat)lY btY:(CGFloat)btY;

// 生成带圆角的阴影layer
/*
 CGRect rect  = CGRectMake(10, 10, 100, 100);
 CAShapeLayer * layer = [UIView shadowLayer:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10) shadowColor:nil shadowOpacity:1 shadowOffset:CGSizeMake(2, 2) fillColor:nil];
 
 [self.layer insertSublayer:layer atIndex:0];
 */
+ (CAShapeLayer *)shadowLayer:(CGRect)rect
            byRoundingCorners:(UIRectCorner)corners
                  cornerRadii:(CGSize)cornerRadii
                  shadowColor:(UIColor * _Nullable)shadowColor
                shadowOpacity:(CGFloat)shadowOpacity
                 shadowOffset:(CGSize)shadowOffset
                    fillColor:(UIColor * _Nullable)fillColor;

// 设置指定的圆角
- (void)rectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii;

@end
