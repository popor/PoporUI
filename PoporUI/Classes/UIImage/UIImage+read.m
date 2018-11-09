//
//  UIImage+read.m
//  Pods-PoporUI_Example
//
//  Created by apple on 2018/11/9.
//

#import "UIImage+read.h"

@implementation UIImage (read)

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
