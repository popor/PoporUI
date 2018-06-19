//
//  UIButton+CommonStyle.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIButton (CommonStyle)

/**
 * 创建btn，默认  字体:F15  颜色:白  圆角弧度:9
 * 传入:按钮默认状态颜色、按下高亮状态颜色、禁用状态颜色
 */
+ (UIButton*)createBtnWithBtnStateNormalColor:(UIColor*)normalColor
                          addHighlightedColor:(UIColor*)highlightedColor
                             addDisabledColor:(UIColor*)disabledColor;

/**
 * 创建一个蓝色的按钮，登录、保存、重新提交等地方使用
 */
+ (UIButton*)createBlueBtn;

/**
 * 创建一个白色的按钮，目前就登录页面使用
 */
+ (UIButton*)createWhiteBtn;

/**
 * 创建一个红色的按钮
 */
+ (UIButton*)createRedBtn;

@end
