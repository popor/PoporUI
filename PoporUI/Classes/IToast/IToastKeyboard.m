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

+ (IToastKeyboard *)shareIToastKeyboard {
    static IToastKeyboard * oneRK = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneRK = [[self alloc] init];
        [oneRK addMonitor];
    });
    return oneRK;
}

- (void)addMonitor {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark - 键盘通知事件
- (void)keyboardShow:(NSNotification *)note {
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyboardH = keyBoardRect.size.height;
}

- (void)keyboardHide:(NSNotification *)note {
    self.keyboardH = 0;
}

+ (void)alertTitle:(NSString *)title {
    [self alertTitle:title duration:0.5 copy:NO];
}

+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration {
    [self alertTitle:title duration:duration copy:NO];
}

+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration copy:(BOOL)copy {
    if ([title isEqualToString:@""] || !title) {
        NSLog(@"提示语为空");
        return;
    }
    if (duration == 0 || duration == -1) {
        duration = 0.5;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        IToast_Popor * oneIT=[[IToast_Popor alloc] initWithText:title];
        [oneIT setDuration:duration * 1000];
        [oneIT show:iToastTypePoporNotice];
        
        if (copy) {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            [pasteboard setString:title];
        }
    });
}

@end
