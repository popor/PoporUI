//
//  UIImage+pSave.h
//  PoporUI
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 popor. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (pSave)

+ (BOOL)saveImage:(UIImage *)image imagePath:(NSString *)imagePath;

@end

NS_ASSUME_NONNULL_END
