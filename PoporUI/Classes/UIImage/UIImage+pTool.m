//
//  UIImage+pTool.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//
#import "UIImage+pTool.h"

@implementation UIImage (pTool)

#pragma mark - 或许模仿苹果聊天的背景图片
+ (UIImage *)stretchableImage:(UIImage *)image orient:(UIImageOrientation)direction point:(CGPoint)point {
    UIImage * twoI=[UIImage imageWithCGImage:image.CGImage scale:1.0 orientation:direction];
    return [twoI stretchableImageWithLeftCapWidth:point.x topCapHeight:point.y];
    //    if (leftOrRight) {
    //        return [oneI stretchableImageWithLeftCapWidth:thePoint.x
    //                                         topCapHeight:thePoint.y];
    //    }else {
    //        UIImage * twoI=[UIImage imageWithCGImage:oneI.CGImage scale:1.0
    //                                     orientation:direction];
    //        return [twoI stretchableImageWithLeftCapWidth:thePoint.x
    //                                         topCapHeight:thePoint.y];
    //    }
}

+ (NSString *)getAppLaunchImage {
    NSDictionary * dic =
    @{
      @"320x480" : @"LaunchImage-700",
      @"320x568" : @"LaunchImage-700-568h",
      @"375x667" : @"LaunchImage-800-667h",
      @"414x736" : @"LaunchImage-800-Portrait-736h"
      };
    
    NSString * key = [NSString stringWithFormat:@"%dx%d", (int)[UIScreen mainScreen].bounds.size.width, (int)[UIScreen mainScreen].bounds.size.height];
    return [dic objectForKey:key];
}

/*
 作者：ITCodeShare
 链接：https://www.jianshu.com/p/99c3e6a6c033
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */
#pragma mark - 图片压缩
- (NSData *)compressWithMaxLength:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    if (data.length < maxLength) return data;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
        //NSLog(@"Compression = %.1f", compression);
        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
    if (data.length < maxLength) return data;
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //NSLog(@"Ratio = %.1f", ratio);
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
    }
    //NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
    return data;
}

@end
