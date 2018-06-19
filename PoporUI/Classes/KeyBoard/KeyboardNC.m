//
//  keyboardNotification.m
//  Wanzi
//
//  Created by 王凯庆 on 2016/11/15.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import "KeyboardNC.h"

@implementation KeyboardNC

+ (void)willShowInfo:(NSNotification *)notification block:(void(^)(float animationTime, float keyboardHeight))keyboardWillShowBlock
{
    //NSLog(@"dic: %@", [notification description]);
    //CGRect beginRect = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endRect	 = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //#warning keyboard will run 3 time
    // 现在仍然会走2次
    //if ((beginRect.origin.y != ScreenSize.height) && beginRect.size.height != 0)
    {
        float animationTime = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
        
        keyboardWillShowBlock(animationTime, endRect.size.height);
    }
}

@end
