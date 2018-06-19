//
//  WanziRecorderKeyboard.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "IToastKeyboard.h"

@implementation IToastKeyboard

+ (void)load {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        [IToastKeyboard shareIToastKeyboard];
    });
}

+ (IToastKeyboard *)shareIToastKeyboard
{
    static IToastKeyboard * oneRK = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneRK = [[self alloc] init];
        [oneRK addMonitor];
    });
    return oneRK;
}

- (void)addMonitor
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark - 键盘通知事件
-(void)keyboardShow:(NSNotification *)note
{
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyboardH = keyBoardRect.size.height;
}

-(void)keyboardHide:(NSNotification *)note
{
    self.keyboardH = 0;
}

+ (void)alertToastTitle:(NSString *)title
{
    if ([title isEqualToString:@""] || !title) {
        NSLog(@"提示语为空");
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        IToast * oneIT=[[IToast alloc] initWithText:title];
        [oneIT setDuration:2.0 * 1000];
        [oneIT show:iToastTypeNotice];
    });
}

+ (void)alertToastTitle:(NSString *)title duration:(NSInteger)duration
{
    if ([title isEqualToString:@""] || !title) {
        NSLog(@"提示语为空");
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        IToast * oneIT=[[IToast alloc] initWithText:title];
        [oneIT setDuration:duration * 1000];
        [oneIT show:iToastTypeNotice];
    });
}

+ (void)alertToastTitleCopy:(NSString *)title {
    if (title) {
        [IToastKeyboard alertToastTitle:title];
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:title];
    }
}

@end
