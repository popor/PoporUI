//
//  UIButton+UIEdgeInsets.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EdgeInsetType) {
    EdgeInsetType_Top = 0,      //上
    EdgeInsetType_Left,         //左
    EdgeInsetType_Bottom,       //下
    EdgeInsetType_Right         //右
};

@interface UIButton (UIEdgeInsets)

-(void)setEdgeInsetType:(EdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap;

@end
