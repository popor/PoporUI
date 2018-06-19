//
//  UITextField+MaxLength.h
//  Wanzi
//
//  Created by 王凯庆 on 2016/12/3.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (MaxLength)

// 这个不需要手动移除,但是需要RAC支持
- (void)addRacMaxLength:(int)maxLength Block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock;

// 这个需要手动移除
+ (void)addNormalDidChangeNCTarget:(id)target action:(SEL)action;
+ (void)removeDidChangeNCTarget:(id)target;

//- (void)textFiledDidChanged:(NSNotification *)dic
//{
//    UITextField * textField = (UITextField *)dic.object;
//    [textField textFieldMaxLength:MaxTextFieldLength block:^(BOOL isEditing, BOOL isOutRange) {
//        if (isOutRange) {
//            AlertToastTitle(@"字数已达上限");
//        }
//    }];
//}

- (void)textFieldMaxLength:(int)maxLength block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock;

@end
