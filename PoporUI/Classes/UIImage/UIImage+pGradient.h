//
//  UIImage+pGradient.h
//  PoporUI
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 popor. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (pGradient)

// 渐变色
+ (UIImage*)gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors gradientHorizon:(BOOL)gradientHorizon;
+ (UIImage*)gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors addStartPoint:(CGPoint)startPoint addEndPoint:(CGPoint)endPoint;

/**
 CGPointMake(0, 0);// 开始点
 CGPointMake(0, 1);// 结束点
 
 NSArray * colors =
 
 @[
 PRGBF  (0, 0, 0, 0.6)
 , PRGBF(0, 0, 0, 0.4)
 , PRGBF(0, 0, 0, 0.1)
 , PRGBF(0, 0, 0, 0.0)
 , PRGBF(0, 0, 0, 0.0)
 , PRGBF(0, 0, 0, 0.1)
 , PRGBF(0, 0, 0, 0.4)
 , PRGBF(0, 0, 0, 0.6)
 ];
 
 NSArray * locations =
 @[@0.0
 , @0.15
 , @0.3
 , @0.35
 , @0.65
 , @0.7
 , @0.85
 , @1.0
 ];// 区间
 
 用法:
 1  [UIImage imageFromLayer:gradientLayer];
 2  [view.layer addSublayer:gradientLayer];
 */
+ (CAGradientLayer *)gradientLayer:(CGRect)bounds colors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations start:(CGPoint)start end:(CGPoint)end;

@end

NS_ASSUME_NONNULL_END
