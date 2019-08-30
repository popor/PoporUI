//
//  UIImage+pCreate.h
//  PoporUI
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 popor. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (pCreate)

#pragma mark - 生成:根据颜色
+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size corner:(CGFloat)corner;

+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size corner:(CGFloat)corner borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

#pragma mark - 制定圆角
+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size corner:(CGFloat)corner corners:(UIRectCorner)corners borderWidth:(CGFloat)borderWidth borderColor:(UIColor * _Nullable)borderColor;

+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size corner:(CGFloat)corner corners:(UIRectCorner)corners borderWidth:(CGFloat)borderWidth borderColor:(UIColor * _Nullable)borderColor borderInset:(UIEdgeInsets)borderInset scale:(CGFloat)scale;
/*
 // 单独某个角设置圆角
 UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.noteReadStatusL.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(CustomizeCellCorner, CustomizeCellCorner)];
 
 CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
 maskLayer.frame = self.noteReadStatusL.bounds;
 maskLayer.path = maskPath.CGPath;
 self.noteReadStatusL.layer.mask = maskLayer;
 */

#pragma mark - 生成:根据图片文字
//@{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : 30 ], NSForegroundColorAttributeName :[ UIColor whiteColor ] }
// 文字在图片中间
+ (UIImage *)imageFromImage:(UIImage *)image str:(NSString *)str dic:(NSDictionary *)dic scale:(CGFloat)scale;

#pragma mark - 生成:根据图片
+ (UIImage *)imageFromImage:(UIImage *)image size:(CGSize)size;
+ (UIImage *)imageFromImage:(UIImage *)image size:(CGSize)size corner:(float)corner;

// 图片+边界线, 如果imageDrawRect==CGRectZero,则居中铺满
+ (UIImage *)imageFromImage:(UIImage *)image size:(CGSize)size imageDrawRect:(CGRect)imageDrawRect corner:(CGFloat)corner borderWidth:(CGFloat)borderWidth borderColor:(UIColor * _Nullable)borderColor;

// 图片+背景色+边界线
+ (UIImage *)imageFromImage:(UIImage *)image size:(CGSize)size imageDrawRect:(CGRect)imageDrawRect bgColor:(UIColor * _Nullable)bgColor corner:(CGFloat)corner borderWidth:(CGFloat)borderWidth borderColor:(UIColor * _Nullable)borderColor scale:(CGFloat)scale;

#pragma mark - 修改图片
// 更改图片色系
+ (UIImage *)imageFromImage:(UIImage *)image changecolor:(UIColor *)color;
+ (UIImage *)imageFromImage:(UIImage *)image changecolor:(UIColor *)color scale:(CGFloat)scale;
// 更改图片背景色
+ (UIImage *)imageFromImage:(UIImage *)image bgColor:(UIColor *)color;
+ (UIImage *)imageFromImage:(UIImage *)image bgColor:(UIColor *)color scale:(CGFloat)scale;

#pragma mark - 根据图片叠加图片
+ (UIImage *)imageFromBaseImage:(UIImage *)baseImage addImage:(UIImage *)addImage size:(CGSize)size;
+ (UIImage *)imageFromBaseImage:(UIImage *)baseImage addImage:(UIImage *)addImage size:(CGSize)size scale:(CGFloat)scale;

#pragma mark - 从View上截图
+ (UIImage *)imageFromView:(UIView *)view;

#pragma mark - 图片压缩
- (UIImage *)scaleWidth:(CGFloat)width;
- (UIImage *)scaleWidth:(CGFloat)width scale:(CGFloat)scale;
- (UIImage *)scaleWidthScale:(CGFloat)wScale scale:(CGFloat)scale;

@end

NS_ASSUME_NONNULL_END
