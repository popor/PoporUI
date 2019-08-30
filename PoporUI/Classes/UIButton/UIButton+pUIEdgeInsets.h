//
//  UIButton+pUIEdgeInsets.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PEdgeInsetType) {
    PEdgeInsetType_Top = 0,      //上
    PEdgeInsetType_Left,         //左
    PEdgeInsetType_Bottom,       //下
    PEdgeInsetType_Right         //右
};

@interface UIButton (pUIEdgeInsets)

-(void)setEdgeInsetType:(PEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap;

@end
