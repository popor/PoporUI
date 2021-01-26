//
//  UIViewController+pTapEndEdit.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PoporFoundation/Block+pPrefix.h>

typedef BOOL(^UIViewController_pTapEndEdit_BlockRBoolPVoid) (void);

@interface UIViewController (pTapEndEdit)

@property (nonatomic, strong) UITapGestureRecognizer  * tapEndEditGR;

// 询问是否终止输入状态
@property (nonatomic, copy  ) UIViewController_pTapEndEdit_BlockRBoolPVoid tapEndEditGRActionEnableBlock;

// 点击view的额外接口, 因为输入框有时候不属于vc, 而属于nc.bar
@property (nonatomic, copy  ) BlockPVoid                                   tapEndEditGRActionExtraBlock;
 
- (void)addTapEndEditGRAction;
- (void)startMonitorTapEdit;
- (void)stopMonitorTapEdit;

// 回调
- (void)keyboardFrameChanged:(CGRect)rect duration:(CGFloat)duration show:(BOOL)show;

@end
