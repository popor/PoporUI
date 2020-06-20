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
    if (self.titleLabel.attributedText) {
        textSize = [self.titleLabel.attributedText sizeWithWidth:maxWidth];
    } else {
        textSize = [self.titleLabel.text sizeInFont:self.titleLabel.font width:maxWidth];
    }
    
    CGFloat labelWidth  = textSize.width;
    CGFloat labelHeight = textSize.height;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    switch (edgeInsetType) {
        case PEdgeInsetType_Top:
        case PEdgeInsetType_TopLeft:
        case PEdgeInsetType_TopRight:{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, MAX(labelWidth, imageWith), imageHeight + labelHeight + spaceGap);
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
            
            labelEdgeInsets   = UIEdgeInsetsMake(textTop, -imageWith, 0, -0);
            break;
        }
        case PEdgeInsetType_Left:
        case PEdgeInsetType_LeftTop:
        case PEdgeInsetType_LeftBottom: {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelWidth +imageWith +spaceGap, MAX(imageHeight, labelHeight));
            
            CGFloat imageMove = 0;
            // 特别矮的图片, 不太好操作, 高图 不需要修改, 可以自适应
            if (edgeInsetType == PEdgeInsetType_Left) {
                //imageMove = 0;
            } else if (edgeInsetType == PEdgeInsetType_LeftTop){
                imageMove = -(self.frame.size.height - imageHeight)/2;
            } else {
                imageMove = (self.frame.size.height - imageHeight)/2;
            }
            
            imageEdgeInsets   = UIEdgeInsetsMake(imageMove, -spaceGap/2, -imageMove, spaceGap/2);
            labelEdgeInsets   = UIEdgeInsetsMake(0, spaceGap/2 + spaceGap, 0, -spaceGap/2);
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
            
            labelEdgeInsets   = UIEdgeInsetsMake(0, -imageWith, textBottom, -0);
            break;
        }
       
        case PEdgeInsetType_Right:
        case PEdgeInsetType_RightTop:
        case PEdgeInsetType_RightBottom: {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelWidth +imageWith +spaceGap, MAX(imageHeight, labelHeight));
            
            labelEdgeInsets   = UIEdgeInsetsMake(0, -imageWith, 0, imageWith + spaceGap);
            
            CGFloat imageMove = 0;
            // 特别矮的图片, 不太好操作, 高图 不需要修改, 可以自适应
            if (edgeInsetType == PEdgeInsetType_Right) {
                //imageMove = 0;
            } else if (edgeInsetType == PEdgeInsetType_RightTop){
                imageMove = -(self.frame.size.height - imageHeight)/2;
            } else {
                imageMove = (self.frame.size.height - imageHeight)/2;
            }
            imageEdgeInsets = UIEdgeInsetsMake(imageMove, labelWidth*2 +spaceGap/2, -imageMove, -spaceGap/2);
            
            break;
        }
        case PEdgeInsetType_Center: {
            // Do Nothing
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

/**
 edgeInsetType  此时 只针对PEdgeInsetType_Top,PEdgeInsetType_Left,PEdgeInsetType_Bottom,PEdgeInsetType_Right
 left 和 right 使用size的width, top和bottom使用size的heigt, center使用size的width和height.
 */
- (void)updateSize:(CGSize)size type:(PEdgeInsetType)edgeInsetType {
    switch (edgeInsetType) {
        case PEdgeInsetType_Top:
        case PEdgeInsetType_TopLeft:
        case PEdgeInsetType_TopRight:{
            if (size.height > self.height) {
                CGFloat move = size.height - self.height;
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, size.height);
                self.contentEdgeInsets = UIEdgeInsetsMake(self.contentEdgeInsets.top + move, self.contentEdgeInsets.left, self.contentEdgeInsets.bottom, self.contentEdgeInsets.right);
            }
            break;
        }
        case PEdgeInsetType_Left:
        case PEdgeInsetType_LeftTop:
        case PEdgeInsetType_LeftBottom: {
            if (size.width > self.width) {
                CGFloat move = size.width - self.width;
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, self.frame.size.height);
                self.contentEdgeInsets = UIEdgeInsetsMake(self.contentEdgeInsets.top, self.contentEdgeInsets.left +move, self.contentEdgeInsets.bottom, self.contentEdgeInsets.right);
            }
            break;
        }
        case PEdgeInsetType_Bottom:
        case PEdgeInsetType_BottomLeft:
        case PEdgeInsetType_BottomRight: {
            if (size.height > self.height) {
                CGFloat move = size.height - self.height;
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, size.height);
                self.contentEdgeInsets = UIEdgeInsetsMake(self.contentEdgeInsets.top, self.contentEdgeInsets.left, self.contentEdgeInsets.bottom + move, self.contentEdgeInsets.right);
            }
            
            break;
        }
        case PEdgeInsetType_Right:
        case PEdgeInsetType_RightTop:
        case PEdgeInsetType_RightBottom: {
            if (size.width > self.width) {
                CGFloat move = size.width - self.width;
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, self.frame.size.height);
                self.contentEdgeInsets = UIEdgeInsetsMake(self.contentEdgeInsets.top, self.contentEdgeInsets.left, self.contentEdgeInsets.bottom, self.contentEdgeInsets.right +move);
            }
            break;
        }
        case PEdgeInsetType_Center: {
            CGFloat x      = 0;
            CGFloat y      = 0;
            CGFloat width  = self.frame.size.width;
            CGFloat height = self.frame.size.height;
            if (size.width > self.width) {
                x = (size.width - self.width)/2;
                width = size.width;
            }
            if (size.height > self.height) {
                y = (size.height - self.height)/2;
                height = size.height;
            }
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
            self.contentEdgeInsets = UIEdgeInsetsMake(self.contentEdgeInsets.top + y, self.contentEdgeInsets.left + x, self.contentEdgeInsets.bottom + y, self.contentEdgeInsets.right+x);
            break;
        }
    }
}

@end
