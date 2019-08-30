//
//  UIImage+pTool.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIImage (pTool)

#pragma mark - 或许模仿苹果聊天的背景图片
+ (UIImage *)stretchableImage:(UIImage *)image orient:(UIImageOrientation)direction point:(CGPoint)point;

+ (NSString *)getAppLaunchImage;

/*
 作者：ITCodeShare
 链接：https://www.jianshu.com/p/99c3e6a6c033
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */
#pragma mark - 图片压缩
- (NSData *)compressWithMaxLength:(NSUInteger)maxLength;

@end

