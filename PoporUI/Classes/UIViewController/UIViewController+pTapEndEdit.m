//
//  UIViewController+pTapEndEdit.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIViewController+pTapEndEdit.h"
#import <objc/runtime.h>

@implementation UIViewController (pTapEndEdit)
@dynamic tapEndEditGR;

- (void)addTapEndEditGRAction {
    if (!self.tapEndEditGR) {
        self.tapEndEditGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEndEditGRAction)];
        
        /**
         https://www.jianshu.com/p/ef83864655fe
         两者同时使用时touchesBegan执行延时touchesCancelled先执行因此看不到触摸效果，
         通过断点可知touchesBegan是执行了的并且断点后每次点击都会有效果，
         对UITapGestureRecognizer添加 _tapGR.cancelsTouchesInView = NO;可解决问题
         
         假如 view 上面有touchevent 接收的事件, 可以继续进行, 比如YYTextView的点击事件.
         */
        self.tapEndEditGR.cancelsTouchesInView = NO;
        
        [self.view addGestureRecognizer:self.tapEndEditGR];
    }
    
    self.tapEndEditGR.enabled = NO;
}

- (void)startMonitorTapEdit {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tapEndEditGR_keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tapEndEditGR_keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tapEndEditGR_keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tapEndEditGR_keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}
- (void)stopMonitorTapEdit {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)tapEndEditGRAction {
    [self.view endEditing:YES];
    [self.view becomeFirstResponder];
    self.tapEndEditGR.enabled = NO;
}

#pragma mark - 键盘通知
- (void)tapEndEditGR_keyboardWillShow:(NSNotification *)notification {
    CGRect endRect      = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat animationTime = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self keyboardFrameChanged:endRect duration:animationTime show:YES];
    });
}

- (void)tapEndEditGR_keyboardDidShow:(NSNotification *)notification {
    self.tapEndEditGR.enabled = YES;
}

- (void)tapEndEditGR_keyboardWillHide:(NSNotification *)notification {
    CGFloat animationTime = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self keyboardFrameChanged:CGRectZero duration:animationTime show:NO];
    });
    [self.view becomeFirstResponder];
}

- (void)tapEndEditGR_keyboardDidHide:(NSNotification *)notification {
    self.tapEndEditGR.enabled = NO;
}

- (void)keyboardFrameChanged:(CGRect)rect duration:(CGFloat)duration show:(BOOL)show {
    
}

#pragma mark - set get
- (void)setTapEndEditGR:(UITapGestureRecognizer *)tapEndEditGR {
    objc_setAssociatedObject(self, @"tapEndEditGR", tapEndEditGR, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer *)tapEndEditGR {
    return objc_getAssociatedObject(self, @"tapEndEditGR");
}

@end
