//
//  UITextView+MaxLength.h
//  Wanzi
//
//  Created by 王凯庆 on 2016/12/3.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (MaxLength)

+ (void)addDidChangeNCTarget:(id)target action:(SEL)action;
+ (void)removeDidChangeNCTarget:(id)target;

//- (void)textViewDidChanged:(NSNotification *)dic
//{
//    UITextView * textView = (UITextView *)dic.object;
//    [textView textViewMaxLength:MaxNoteTextLength block:^(BOOL isEditing, BOOL isOutRange) {
//        if (isEditing) {
//            // DoNothing
//        }else{
//            if (isOutRange) {
//                self.noteMaxWordL.text = [NSString stringWithFormat:@"%i/%i", MaxNoteTextLength, MaxNoteTextLength];
//                AlertToastTitle(@"字数已达上限");
//            }else{
//                self.noteMaxWordL.text = [NSString stringWithFormat:@"%i/%i", (int)textView.text.length, MaxNoteTextLength];
//            }
//        }
//    }];
//}

- (void)textViewMaxLength:(int)maxLength block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock;

@end
