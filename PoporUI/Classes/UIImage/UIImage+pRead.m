//
//  UIImage+pRead.m
//  PoporUI
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 popor. All rights reserved.

#import "UIImage+pRead.h"

@implementation UIImage (pRead)

+ (NSString *)absoPathInBundleResource:(NSString *)fileName {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
}

+ (UIImage *)imageWithImageName:(NSString *)imageName {
    return [UIImage imageWithContentsOfFile:[self absoPathInBundleResource:imageName]];
}

+ (UIImage *)imageWithAbsImageFile:(NSString *)absImageFile {
    UIImage * image = [UIImage imageWithContentsOfFile:absImageFile];
    if (image.imageOrientation != UIImageOrientationUp) {
        image=[UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationUp];
    }
    return image;
}

@end
