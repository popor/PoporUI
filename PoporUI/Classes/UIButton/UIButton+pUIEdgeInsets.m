//
//  UIButton+pUIEdgeInsets.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//
#import "UIButton+pUIEdgeInsets.h"
#import <PoporFoundation/NSString+pSize.h>
#import <PoporFoundation/NSAttributedString+pAtt.h>
#import "UIView+pExtension.h"

@implementation UIButton (pUIEdgeInsets)

/**
 *  设置 bt 的image的相对位置, 默认为title是居中的. 后期增加左右对齐的方式
 *
 *  @param edgeInsetType image 的位置
 *  @param spaceGap title 和 image 间距
 *  @param titleWidth 允许的最大宽度
 *  @param attTitle 是否使用 setAttributedTitle 方法, 目前发现不同的方法计算的titlt.size数据不一致
 */
- (void)setImageInset:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap titleWidth:(CGFloat)titleWidth attTitle:(BOOL)attTitle {
    [self setImageInset:edgeInsetType spaceGap:spaceGap titleWidth:titleWidth attTitle:attTitle textSize:CGSizeZero];
}

- (void)setImageInset:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap titleWidth:(CGFloat)titleWidth attTitle:(BOOL)attTitle textSize:(CGSize)textSize {

    
    self.titleLabel.numberOfLines = 0;
    CGFloat imageWith   = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    //    {   // 测试数据
    //        NSLog(@"spaceGap: %f", spaceGap);
    //        NSLog(@"imageWith: %f, imageHeight: %f", imageWith, imageHeight);
    //        self.titleLabel.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0 alpha:0.2];
    //        self.imageView.backgroundColor  = [UIColor redColor];
    //        self.backgroundColor            = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    //        
    //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //            NSLog(@"0.5秒后");
    //            NSLog(@"self.imageView.frame: %@", NSStringFromCGRect(self.imageView.frame));
    //            NSLog(@"UIButton.frame: %@", NSStringFromCGRect(self.frame));
    //        });
    //    }
    
    if (titleWidth <= 0) {
        titleWidth = self.frame.size.width;
    }
    
    if (CGSizeEqualToSize(CGSizeZero, textSize)) {
        if (attTitle) {
            textSize = [self.titleLabel.attributedText sizeWithWidth:titleWidth];
        } else {
            textSize = [self.titleLabel.text sizeInFont:self.titleLabel.font width:titleWidth];
        }
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
                imageMove = 0;
            } else if (edgeInsetType == PEdgeInsetType_TopLeft) {
                imageMove = -imageMove;
            } else {
                //imageMove = imageMove;
            }
            
            imageEdgeInsets = UIEdgeInsetsMake(0, imageLeft +imageMove, imageBottom , -imageMove);
            
            CGFloat labelMove = 0;
            if (imageWith > labelWidth) {
                labelMove = (imageWith - labelWidth)/2;
            }
            
            labelEdgeInsets = UIEdgeInsetsMake(textTop, -imageWith +labelMove, 0, labelMove);
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
            
            // 现更改image的位移.
            imageEdgeInsets = UIEdgeInsetsMake(imageMove, 0, -imageMove, spaceGap + labelWidth);
            // 此时title会跟随image移动到左侧, 然后再让lable右移spaceGap即可
            labelEdgeInsets = UIEdgeInsetsMake(0, spaceGap, 0, 0);
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
                imageMove = 0;
            } else if (edgeInsetType == PEdgeInsetType_BottomLeft) {
                imageMove = -imageMove;
            } else {
                //imageMove = imageMove;
            }
            
            imageEdgeInsets = UIEdgeInsetsMake(imageTop, imageLeft+imageMove, 0 , -imageMove);
            
            CGFloat labelMove = 0;
            if (imageWith > labelWidth) {
                labelMove = (imageWith - labelWidth)/2;
            }
            
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith +labelMove, textBottom, labelMove);
            break;
        }
            
        case PEdgeInsetType_Right:
        case PEdgeInsetType_RightTop:
        case PEdgeInsetType_RightBottom: {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelWidth +imageWith +spaceGap, MAX(imageHeight, labelHeight));
            
            CGFloat imageMove = 0;
            // 特别矮的图片, 不太好操作, 高图 不需要修改, 可以自适应
            if (edgeInsetType == PEdgeInsetType_Right) {
                //imageMove = 0;
            } else if (edgeInsetType == PEdgeInsetType_RightTop){
                imageMove = -(self.frame.size.height - imageHeight)/2;
            } else {
                imageMove = (self.frame.size.height - imageHeight)/2;
            }
            
            imageEdgeInsets = UIEdgeInsetsMake(imageMove, labelWidth +spaceGap/2, -imageMove, -spaceGap/2);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith -spaceGap/2, 0, imageWith + spaceGap/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spaceGap/2, 0, spaceGap/2);
            
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
