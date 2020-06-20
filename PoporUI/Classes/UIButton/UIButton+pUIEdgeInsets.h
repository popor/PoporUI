//
//  UIButton+pUIEdgeInsets.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PEdgeInsetType) {
    PEdgeInsetType_Top = 0,
    PEdgeInsetType_TopLeft,
    PEdgeInsetType_TopRight,
    
    PEdgeInsetType_Left,
    PEdgeInsetType_LeftTop,
    PEdgeInsetType_LeftBottom,
    
    PEdgeInsetType_Bottom,
    PEdgeInsetType_BottomLeft,
    PEdgeInsetType_BottomRight,
    
    
    PEdgeInsetType_Right,
    PEdgeInsetType_RightTop,
    PEdgeInsetType_RightBottom,
    
    PEdgeInsetType_Center, // 只用于 updateWidth:type:
};

@interface UIButton (pUIEdgeInsets)

/**
 左右的时候, maxWidth 为tittle的最大宽度
 上下的时候, maxWidth 为title的最大宽度
 
 目前缺少固定宽度的方法.
 */
- (void)setEdgeInsetType:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap maxWidth:(CGFloat)maxWidth;

/**
 edgeInsetType  此时 只针对PEdgeInsetType_Top,PEdgeInsetType_Left,PEdgeInsetType_Bottom,PEdgeInsetType_Right
 left 和 right 使用size的width, top和bottom使用size的heigt, center使用size的width和height.
 left 对应 空白处添加到左边 ...
 
 */
- (void)updateSize:(CGSize)size type:(PEdgeInsetType)edgeInsetType;

@end
