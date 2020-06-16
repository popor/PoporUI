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
    NSLog(@"spaceGap: %f", spaceGap);
    NSLog(@"image: %@", NSStringFromCGSize(self.imageView.image.size));
    
    CGFloat imageWith   = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    //NSLog(@"imageWith: %f, imageHeight: %f", imageWith, imageHeight);
    
    if (maxWidth <= 0) {
        maxWidth = self.frame.size.width;
    }
    CGSize testSize     = [self.titleLabel.text sizeInFont:self.titleLabel.font width:maxWidth];
    CGFloat labelWidth  = testSize.width;//ceil(MAX(self.titleLabel.frame.size.width, size.width));
    CGFloat labelHeight = testSize.height;//ceil(MAX(self.titleLabel.frame.size.height, size.height));
    
    UIEdgeInsets imageEdgeInsets   = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets   = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    
    switch (edgeInsetType) {
        case PEdgeInsetType_Top: {
            self.bounds = CGRectMake(0, 0, MAX(labelWidth, imageWith), imageHeight + labelHeight + spaceGap);
            
            NSLog(@"self.bounds: %@", NSStringFromCGRect(self.bounds));
            NSLog(@"lable.size: %@", NSStringFromCGSize(testSize));
            
            CGFloat imageBottom = self.bounds.size.height - imageHeight;
            CGFloat imageLeft   = fabs(labelWidth - imageWith)/2 +0;
            CGFloat textTop     = self.bounds.size.height - labelHeight;
            CGFloat textLeft    = fabs(labelWidth - imageWith)/2 +2;
            
            imageEdgeInsets   = UIEdgeInsetsMake(0, imageLeft, imageBottom , 0);
            labelEdgeInsets   = UIEdgeInsetsMake(textTop, -textLeft, 0, textLeft);
            contentEdgeInsets = UIEdgeInsetsMake(0, 0, spaceGap, 0);
            
            break;
        }
        case PEdgeInsetType_Left: {
            imageEdgeInsets   = UIEdgeInsetsMake(0, 0, 0, 0);
            labelEdgeInsets   = UIEdgeInsetsMake(0, spaceGap, 0, -spaceGap);
            contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spaceGap);
            break;
        }
        case PEdgeInsetType_Bottom: {
            self.bounds = CGRectMake(0, 0, MAX(labelWidth, imageWith), imageHeight + labelHeight + spaceGap);
            
            imageEdgeInsets   = UIEdgeInsetsMake(0, 0, -labelHeight-spaceGap/2.0, -labelWidth);
            labelEdgeInsets   = UIEdgeInsetsMake(-imageHeight-spaceGap/2.0, -imageWith, 0, 0);
            contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spaceGap);
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
