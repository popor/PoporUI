//
//  UIButton+UIEdgeInsets.h
//  Wanzi
//
//  Created by Bingo on 16/11/23.
//  Copyright © 2016年 wanzi. All rights reserved.
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
