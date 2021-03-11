//
//  UIImage+pGradient.h
//  PoporUI
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 popor. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (pGradient)

/**
 *  获取矩形的渐变色的UIImage(此函数还不够完善)
 *
 *  @param rect     UIImage的bounds
 *  @param colorArray 渐变色数组，可以设置两种颜色
 *  @param horizon    渐变的方式：0--->从上到下   1--->从左到右
 *
 *  @return 渐变色的UIImage
 */
+ (UIImage*)gradientImageRect:(CGRect)rect colorArray:(NSArray *)colorArray horizon:(BOOL)horizon;
+ (UIImage*)gradientImageRect:(CGRect)rect colorArray:(NSArray *)colorArray startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

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
+ (CAGradientLayer *)gradientLayerRect:(CGRect)rect colorArray:(NSArray<UIColor *> *)colors locationArray:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)start endPoint:(CGPoint)end;

@end

NS_ASSUME_NONNULL_END
