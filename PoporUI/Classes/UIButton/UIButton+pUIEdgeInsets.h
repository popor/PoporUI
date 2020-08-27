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

// 只包含title的
- (void)setEdgeType:(PEdgeInsetType)edgeInsetType gap:(CGFloat)spaceGap image:(UIImage *)image title:(NSString *)title titleWidth:(CGFloat)titleWidth;

- (void)setEdgeType:(PEdgeInsetType)edgeInsetType gap:(CGFloat)spaceGap image:(UIImage *)image title:(NSString *)title titleWidth:(CGFloat)titleWidth titleSize:(CGSize)titleSize;

// 只包含att的
- (void)setEdgeType:(PEdgeInsetType)edgeInsetType gap:(CGFloat)spaceGap image:(UIImage *)image att:(NSAttributedString *)att titleWidth:(CGFloat)titleWidth;

- (void)setEdgeType:(PEdgeInsetType)edgeInsetType gap:(CGFloat)spaceGap image:(UIImage *)image att:(NSAttributedString *)att titleWidth:(CGFloat)titleWidth titleSize:(CGSize)titleSize;

/**
 *  设置 bt 的image的相对位置, 默认为title是居中的. 后期增加左右对齐的方式
 *
 *  @param edgeInsetType image 的位置
 *  @param spaceGap title 和 image 间距
 *  @param att attributedText
 *  @param titleWidth 允许的最大宽度
 *  @param titleSize 允许的预设titleSize, 当titleSize为0的话, 需要依赖titleWidth.
 *  self.titleLabel.numberOfLines 参数需要用户自己设定
 */
- (void)setEdgeType:(PEdgeInsetType)edgeInsetType gap:(CGFloat)spaceGap image:(UIImage *)image title:(NSString *)title att:(NSAttributedString *)att titleWidth:(CGFloat)titleWidth titleSize:(CGSize)titleSize;

/**
 edgeInsetType  此时 只针对PEdgeInsetType_Top,PEdgeInsetType_Left,PEdgeInsetType_Bottom,PEdgeInsetType_Right
 left 和 right 使用size的width, top和bottom使用size的heigt, center使用size的width和height.
 left 对应 空白处添加到左边 ...
 
 */
- (void)updateSize:(CGSize)size type:(PEdgeInsetType)edgeInsetType;

@end
