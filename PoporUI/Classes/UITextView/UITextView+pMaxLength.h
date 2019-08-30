//
//  UITextView+pMaxLength.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (pMaxLength)

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
