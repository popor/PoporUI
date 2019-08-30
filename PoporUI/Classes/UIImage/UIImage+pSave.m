//
//  UIImage+pSave.m
//  PoporUI
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 popor. All rights reserved.

#import "UIImage+pSave.h"

@implementation UIImage (pSave)

+ (BOOL)saveImage:(UIImage *)image imagePath:(NSString *)imagePath {
    return [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
}

@end
