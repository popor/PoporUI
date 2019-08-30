//
//  UIImage+pRead.h
//  PoporUI
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 popor. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (pRead)

+ (NSString *)absoPathInBundleResource:(NSString *)fileName;// 只用下一个就足够了.
+ (UIImage *)imageWithImageName:(NSString *)imageName;
+ (UIImage *)imageWithAbsImageFile:(NSString *)absImageFile;

@end

NS_ASSUME_NONNULL_END
