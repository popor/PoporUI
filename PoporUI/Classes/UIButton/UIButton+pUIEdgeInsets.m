//
//  UIButton+pUIEdgeInsets.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//
#import "UIButton+pUIEdgeInsets.h"
#import <PoporFoundation/NSString+pSize.h>
#import "UIView+pExtension.h"

@implementation UIButton (pUIEdgeInsets)

- (void)setEdgeInsetType:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap maxWidth:(CGFloat)maxWidth {
    //NSLog(@"spaceGap: %f", spaceGap);
    //NSLog(@"image: %@", NSStringFromCGSize(self.imageView.image.size));
    
    CGFloat imageWith   = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    //NSLog(@"imageWith: %f, imageHeight: %f", imageWith, imageHeight);
    
    if (maxWidth <= 0) {
        maxWidth = self.frame.size.width;
    }
    CGSize testSize     = [self.titleLabel.text sizeInFont:self.titleLabel.font width:maxWidth];
    CGFloat labelWidth  = testSize.width;
    CGFloat labelHeight = testSize.height;
    
    UIEdgeInsets imageEdgeInsets   = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets   = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    
    switch (edgeInsetType) {
        case PEdgeInsetType_Top: {
            self.bounds = CGRectMake(self.frame.origin.x, self.frame.origin.y, MAX(labelWidth, imageWith), imageHeight + labelHeight + spaceGap);
            //NSLog(@"self.bounds: %@", NSStringFromCGRect(self.bounds));
            //NSLog(@"lable.size: %@", NSStringFromCGSize(testSize));
            
            CGFloat imageBottom = self.bounds.size.height - imageHeight;
            CGFloat imageLeft;
            if (imageWith > labelWidth) { // 图片宽度大于文字, 为零即可.
                imageLeft =  0;
            } else {
                imageLeft =  (labelWidth - imageWith)/2.0;
            }
            CGFloat textTop = self.bounds.size.height - labelHeight;

            imageEdgeInsets = UIEdgeInsetsMake(0, imageLeft, imageBottom , 0);
            labelEdgeInsets = UIEdgeInsetsMake(textTop, -imageWith*2, 0, -imageWith);
            
            break;
        }
        case PEdgeInsetType_Left: {
            imageEdgeInsets   = UIEdgeInsetsMake(0, 0, 0, 0);
            labelEdgeInsets   = UIEdgeInsetsMake(0, spaceGap, 0, -spaceGap);
            contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spaceGap);
            break;
        }
        case PEdgeInsetType_Bottom: {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, MAX(labelWidth, imageWith), imageHeight + labelHeight + spaceGap);
            //NSLog(@"self.bounds: %@", NSStringFromCGRect(self.bounds));
            //NSLog(@"lable.size: %@", NSStringFromCGSize(testSize));
            
            CGFloat imageLeft;
            if (imageWith > labelWidth) { // 图片宽度大于文字, 为零即可.
                imageLeft =  0;
            } else {
                imageLeft =  (labelWidth - imageWith)/2.0;
            }
            CGFloat textBottom = self.bounds.size.height - labelHeight;
            CGFloat imageTop   = self.bounds.size.height - imageHeight;
            
            imageEdgeInsets   = UIEdgeInsetsMake(imageTop, imageLeft, 0 , 0);
            labelEdgeInsets   = UIEdgeInsetsMake(0, -imageWith*2, textBottom, -imageWith);
            
            break;
        }
        case PEdgeInsetType_Right: {
            labelEdgeInsets   = UIEdgeInsetsMake(0, -imageWith*2, 0, 0);
            imageEdgeInsets   = UIEdgeInsetsMake(0, labelWidth +spaceGap, 0, -spaceGap);
            contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spaceGap);
            break;
        }
        default:
            break;
    }
    
    self.imageEdgeInsets   = imageEdgeInsets;
    self.titleEdgeInsets   = labelEdgeInsets;
    self.contentEdgeInsets = contentEdgeInsets;
    
    //NSLog(@"image: %@", NSStringFromUIEdgeInsets(self.imageEdgeInsets));
    //NSLog(@"title: w %f - %@", self.titleLabel.width, NSStringFromUIEdgeInsets(self.titleEdgeInsets));
}

@end
