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

@end

NS_ASSUME_NONNULL_END
