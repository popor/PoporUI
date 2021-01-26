//
//  UIViewController+pTapEndEdit.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PoporFoundation/Block+pPrefix.h>

@interface UIViewController (pTapEndEdit)

@property (nonatomic, strong) UITapGestureRecognizer  * tapEndEditGR;

// 点击view的额外接口, 因为输入框有时候不属于vc, 而属于nc.bar
@property (nonatomic, copy  ) BlockPVoid tapEndEditGRActionExtraBlock;
 
- (void)addTapEndEditGRAction;
- (void)startMonitorTapEdit;
- (void)stopMonitorTapEdit;

// 回调
- (void)keyboardFrameChanged:(CGRect)rect duration:(CGFloat)duration show:(BOOL)show;

// 识别到点击事件之后, 询问是否允许生效
- (void)tapEndEditGRActionEnable:(void (^)(void))endBlock;


@end
