//
//  UIViewController+TapEndEdit.h
//  linRunShengPi
//
//  Created by 王凯庆 on 2018/1/7.
//  Copyright © 2018年 艾慧勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TapEndEdit)

@property (nonatomic, strong) UITapGestureRecognizer  * tapEndEditGR;

- (void)addTapEndEditGRAction;
- (void)startMonitorTapEdit;
- (void)stopMonitorTapEdit;

// 回调
- (void)keyboardFrameChanged:(CGRect)rect duration:(CGFloat)duration show:(BOOL)show;

@end
