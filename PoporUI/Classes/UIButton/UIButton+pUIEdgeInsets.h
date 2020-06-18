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
    PEdgeInsetType_Left,
    PEdgeInsetType_Bottom,
    PEdgeInsetType_Right
};

@interface UIButton (pUIEdgeInsets)

/**
 左右的时候, maxWidth 为tittle的最大宽度
 上下的时候, maxWidth 为title的最大宽度
 
 目前缺少固定宽度的方法.
 */
- (void)setEdgeInsetType:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap maxWidth:(CGFloat)maxWidth;

@end
