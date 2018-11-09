//
//  UIButton+CommonStyle.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIButton+CommonStyle.h"

#import "UIImage+create.h"
#import <PoporFoundation/prefixFont.h>
#import <PoporFoundation/prefixColor.h>

@implementation UIButton (CommonStyle)


+ (UIButton*)createBtnWithBtnStateNormalColor:(UIColor*)normalColor
                          addHighlightedColor:(UIColor*)highlightedColor
                             addDisabledColor:(UIColor*)disabledColor
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.3] forState:UIControlStateDisabled];
    
    if (normalColor) {
        [btn setBackgroundImage:[UIImage imageFromColor:normalColor size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    }
    if (highlightedColor) {
        [btn setBackgroundImage:[UIImage imageFromColor:highlightedColor size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];
    }
    if (disabledColor) {
        [btn setBackgroundImage:[UIImage imageFromColor:disabledColor size:CGSizeMake(1, 1)] forState:UIControlStateDisabled];
    }
    //btn.enabled = NO; //显示禁用状态
    
    btn.titleLabel.font = Font15;
    
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 9;
    
    return btn;
}

+ (UIButton*)createBlueBtn {
    UIButton *btn = [UIButton createBtnWithBtnStateNormalColor:ColorBlue1
                                           addHighlightedColor:ColorBlue2
                                              addDisabledColor:ColorBlue3];
    return btn;
}

+ (UIButton*)createWhiteBtn {
    UIButton *btn = [UIButton createBtnWithBtnStateNormalColor:[UIColor whiteColor]
                                           addHighlightedColor:ColorBG1
                                              addDisabledColor:nil];
    
    [btn setTitleColor:ColorBlack6 forState:UIControlStateNormal];
    btn.layer.borderColor = ColorLine.CGColor;
    btn.layer.borderWidth = 0.5;
    
    return btn;
}

+ (UIButton*)createRedBtn {
    UIButton *btn = [UIButton createBtnWithBtnStateNormalColor:ColorRedLight1
                                           addHighlightedColor:ColorRedLight2
                                              addDisabledColor:ColorRedLight1];
    [btn setTitleColor:ColorRed1 forState:UIControlStateNormal];
    return btn;
}

@end
