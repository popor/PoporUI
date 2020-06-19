//
//  UIButton+pUIEdgeInsets.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//
#import "UIButton+pUIEdgeInsets.h"
#import <PoporFoundation/NSString+pSize.h>
#import <PoporFoundation/NSString+pAtt.h>
#import "UIView+pExtension.h"

@implementation UIButton (pUIEdgeInsets)

- (void)setEdgeInsetType:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap maxWidth:(CGFloat)maxWidth {
    self.titleLabel.numberOfLines = 0;
    CGFloat imageWith   = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    //NSLog(@"imageWith: %f, imageHeight: %f", imageWith, imageHeight);
    
    if (maxWidth <= 0) {
        maxWidth = self.frame.size.width;
    }
    
    CGSize textSize;
    //if (self.titleLabel.attributedText) {
        //testSize = [self.titleLabel.attributedText sizeWithWidth:maxWidth];
    //} else {
        textSize = [self.titleLabel.text sizeInFont:self.titleLabel.font width:maxWidth];
    //}
    CGFloat labelWidth  = textSize.width;
    CGFloat labelHeight = textSize.height;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    switch (edgeInsetType) {
        case PEdgeInsetType_Top:
        case PEdgeInsetType_TopLeft:
        case PEdgeInsetType_TopRight:{
            self.bounds = CGRectMake(self.frame.origin.x, self.frame.origin.y, MAX(labelWidth, imageWith), imageHeight + labelHeight + spaceGap);
            //NSLog(@"self.bounds: %@", NSStringFromCGRect(self.bounds));
            
            CGFloat imageBottom = self.bounds.size.height - imageHeight;
            CGFloat imageLeft;
            if (imageWith > labelWidth) { // 图片宽度大于文字, 为零即可.
                imageLeft =  0;
            } else {
                imageLeft =  (labelWidth - imageWith)/2.0;
            }
            CGFloat textTop = self.bounds.size.height - labelHeight;
            
            CGFloat imageMove = (self.frame.size.width - imageWith)/2;
            
            if (edgeInsetType == PEdgeInsetType_Top) {
                imageEdgeInsets = UIEdgeInsetsMake(0, imageLeft, imageBottom , 0);
            } else if (edgeInsetType == PEdgeInsetType_TopLeft) {
                imageEdgeInsets = UIEdgeInsetsMake(0, imageLeft-imageMove, imageBottom , imageMove);
            } else {
                imageEdgeInsets = UIEdgeInsetsMake(0, imageLeft+imageMove, imageBottom , -imageMove);
            }
            
            if (labelHeight >= self.titleLabel.font.pointSize*2) {// 多行title
                labelEdgeInsets   = UIEdgeInsetsMake(textTop, -imageWith, 0, -0);
            } else { // 单行
                labelEdgeInsets   = UIEdgeInsetsMake(textTop, -imageWith*2, 0, -imageWith);
            }
            
            break;
        }
        case PEdgeInsetType_Left:
        case PEdgeInsetType_LeftTop:
        case PEdgeInsetType_LeftBottom: {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelWidth +imageWith +spaceGap, MAX(imageHeight, labelHeight));
            
            CGFloat imageMove = (self.frame.size.height - imageHeight)/2;
            // 特别矮的图片, 不太好操作, 高图 不需要修改, 可以自适应
            if (edgeInsetType == PEdgeInsetType_Left) {
                imageEdgeInsets   = UIEdgeInsetsMake(0, 0, 0, spaceGap/2);
            } else if (edgeInsetType == PEdgeInsetType_LeftTop){
                imageEdgeInsets   = UIEdgeInsetsMake(-imageMove, 0, imageMove, spaceGap/2);
            } else {
                imageEdgeInsets   = UIEdgeInsetsMake(imageMove, 0, -imageMove, spaceGap/2);
            }
            
            labelEdgeInsets   = UIEdgeInsetsMake(0, spaceGap/2, 0, 0);
            break;
        }
        case PEdgeInsetType_Bottom:
        case PEdgeInsetType_BottomLeft:
        case PEdgeInsetType_BottomRight: {
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
            
            CGFloat imageMove = (self.frame.size.width - imageWith)/2;
            if (edgeInsetType == PEdgeInsetType_Bottom) {
                imageEdgeInsets   = UIEdgeInsetsMake(imageTop, imageLeft, 0 , 0);
            } else if (edgeInsetType == PEdgeInsetType_BottomLeft) {
                imageEdgeInsets   = UIEdgeInsetsMake(imageTop, imageLeft-imageMove, 0 , imageMove);
            } else {
                imageEdgeInsets   = UIEdgeInsetsMake(imageTop, imageLeft+imageMove, 0 , -imageMove);
            }
            
            
            if (labelHeight >= self.titleLabel.font.pointSize*2) { // 多行title
                labelEdgeInsets   = UIEdgeInsetsMake(0, -imageWith, textBottom, -0);
            } else { // 单行
                labelEdgeInsets   = UIEdgeInsetsMake(0, -imageWith*2, textBottom, -imageWith);
            }
            break;
        }
        case PEdgeInsetType_Right:
        case PEdgeInsetType_RightTop:
        case PEdgeInsetType_RightBottom: {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelWidth +imageWith +spaceGap, MAX(imageHeight, labelHeight));
            if (labelHeight >= self.titleLabel.font.pointSize*2) {// 多行title
                labelEdgeInsets   = UIEdgeInsetsMake(0, -imageWith, 0, imageWith + spaceGap);
            } else { // 单行
                labelEdgeInsets   = UIEdgeInsetsMake(0, -imageWith*2 - spaceGap, 0, 0);
            }
            
            CGFloat imageMove = (self.frame.size.height - imageHeight)/2;
            // 特别矮的图片, 不太好操作, 高图 不需要修改, 可以自适应
            if (edgeInsetType == PEdgeInsetType_Right) {
                imageEdgeInsets   = UIEdgeInsetsMake(0, labelWidth +spaceGap, 0, -spaceGap);
            } else if (edgeInsetType == PEdgeInsetType_RightTop){
                imageEdgeInsets   = UIEdgeInsetsMake(-imageMove, labelWidth +spaceGap, imageMove, -spaceGap);
            } else {
                imageEdgeInsets   = UIEdgeInsetsMake(imageMove, labelWidth +spaceGap, -imageMove, -spaceGap);
            }
            
            break;
        }
        default:
            break;
    }
    
    self.imageEdgeInsets   = imageEdgeInsets;
    self.titleEdgeInsets   = labelEdgeInsets;
    
    //NSLog(@"image: %@", NSStringFromUIEdgeInsets(self.imageEdgeInsets));
    //NSLog(@"title: w %f - %@", self.titleLabel.width, NSStringFromUIEdgeInsets(self.titleEdgeInsets));
}


- (void)updateLeftTypeWidth:(CGFloat)width {
    if (width > self.width) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
        CGFloat move = width - self.width;
        self.titleEdgeInsets = UIEdgeInsetsMake(self.titleEdgeInsets.top, self.titleEdgeInsets.left, self.titleEdgeInsets.bottom, self.titleEdgeInsets.right + move);
    }
}

- (void)updateRightTypeWidth:(CGFloat)width {
    if (width > self.width) {
        
        
    }
}

@end
