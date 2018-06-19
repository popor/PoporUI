//
//  keyboardNotification.h
//  Wanzi
//
//  Created by 王凯庆 on 2016/11/15.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyboardNC : NSObject

// 防止第三方中文键盘弹出多次
+ (void)willShowInfo:(NSNotification *)notification block:(void(^)(float animationTime, float keyboardHeight))keyboardWillShowBlock;

@end
