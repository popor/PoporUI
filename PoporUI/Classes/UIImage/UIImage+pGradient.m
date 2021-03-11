//
//  UIImage+pGradient.m
//  PoporUI
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 popor. All rights reserved.

#import "UIImage+pGradient.h"

@implementation UIImage (pGradient)

+ (UIImage*)gradientImageRect:(CGRect)rect colorArray:(NSArray*)colorArray horizon:(BOOL)horizon {
    CGPoint startPoint;
    CGPoint endPoint;
    
    if (horizon) {
        startPoint = CGPointMake(0.0, 0.0);
        endPoint = CGPointMake(rect.size.width, 0.0);
    }else{
        startPoint = CGPointMake(0.0, 0.0);
        endPoint = CGPointMake(0.0, rect.size.height);
    }
    
    UIImage *image = [self gradientImageRect:rect colorArray:colorArray startPoint:startPoint endPoint:endPoint];
    return image;
}

+ (UIImage*)gradientImageRect:(CGRect)rect colorArray:(NSArray*)colorArray startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colorArray) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colorArray lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

/**
 CGPointMake(0, 0);// 开始点
 CGPointMake(0, 1);// 结束点
 用法:
 1  [UIImage imageFromLayer:gradientLayer];
 2  [view.layer addSublayer:gradientLayer];
 */
+ (CAGradientLayer *)gradientLayerRect:(CGRect)rect colorArray:(NSArray<UIColor *> *)colorArray locationArray:(NSArray<NSNumber *> *)locationArray startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    if (colorArray.count != locationArray.count) {
        return nil;
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = rect;
    
    NSMutableArray * cgColors = [NSMutableArray new];
    for (UIColor * color in colorArray) {
        [cgColors addObject:(id)color.CGColor];
    }
    
    gradientLayer.colors    = cgColors;
    gradientLayer.locations = locationArray;
    
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint   = endPoint;
    
    return gradientLayer;
}

@end
