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
 *  设置 bt 的image的相对位置, 默认为title是居中的. 后期增加左右对齐的方式
 *
 *  @param edgeInsetType image 的位置
 *  @param spaceGap title 和 image 间距
 *  @param titleWidth 允许的最大宽度
 *  @param attTitle 是否使用 setAttributedTitle 方法, 目前发现不同的方法计算的titlt.size数据不一致
 */
- (void)setImageInset:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap titleWidth:(CGFloat)titleWidth attTitle:(BOOL)attTitle;

/**
 允许自定义textSize.
 */
- (void)setImageInset:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap titleWidth:(CGFloat)titleWidth attTitle:(BOOL)attTitle textSize:(CGSize)textSize;


/**
 edgeInsetType  此时 只针对PEdgeInsetType_Top,PEdgeInsetType_Left,PEdgeInsetType_Bottom,PEdgeInsetType_Right
 left 和 right 使用size的width, top和bottom使用size的heigt, center使用size的width和height.
 left 对应 空白处添加到左边 ...
 
 */
- (void)updateSize:(CGSize)size type:(PEdgeInsetType)edgeInsetType;

@end
