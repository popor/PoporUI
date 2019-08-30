//
//  UITextView_pPasteImage.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UITextView_pPasteImage.h"

@implementation UITextView_pPasteImage

- (void)paste:(id)sender
{
    BOOL isHasImage = [[UIPasteboard generalPasteboard] containsPasteboardTypes:UIPasteboardTypeListImage];
    if (isHasImage) {
        if (self.pasteImageDelegate && [self.pasteImageDelegate respondsToSelector:@selector(textView:pasteImage:)]) {
            [self.pasteImageDelegate textView:self pasteImage:[UIPasteboard generalPasteboard].image];
        }
    } else{
        [super paste:sender];
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (self.overrideNextResponder){
        return NO;
    }else if (action == @selector(paste:) && [UIPasteboard generalPasteboard].image){
        return YES;
    }else{
        return [super canPerformAction:action withSender:sender];
    }
}

// 在firstResponse的情况下,为了显示UIMenuController,也不丢失firstResponse.
// demo原来写法.
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    if (self.overrideNextResponder != nil)
//        return NO;
//    else
//        return [super canPerformAction:action withSender:sender];
//}

- (UIResponder *)nextResponder
{
    if (self.overrideNextResponder){
        return self.overrideNextResponder;
    } else {
        return [super nextResponder];
    }
}



@end


/**
 * 后来发现没有必要如此麻烦,只要继承就好了,没必要重写.
 */

//#import <UIKit/UIKit.h>
//
//@protocol UITextViewPasteImageDelegate <NSObject>
//
//- (void)textView:(UITextView *)textView pasteImage:(UIImage *)image;
//- (void)textView:(UITextView *)textView pasteUrl:(NSURL *)url;
//- (void)textView:(UITextView *)textView pasteString:(NSString *)string;
//
//@end
//
//@interface UITextView (PasteImage)
//
//@property (nonatomic, weak  ) id <UITextViewPasteImageDelegate> pasteImageDelegate;
//
//@end


/**
 * 后来发现没有必要如此麻烦,只要继承就好了,没必要重写.
 */

//#import "UITextView+PasteImage.h"
//
//static char pasteImageDelegateKey;
//
//@implementation UITextView (PasteImage)
//
//- (id<UITextViewPasteImageDelegate>)pasteImageDelegate
//{
//    return objc_getAssociatedObject(self, &pasteImageDelegateKey);
//}
//
//- (void)setPasteImageDelegate:(id<UITextViewPasteImageDelegate>)pasteImageDelegate
//{
//    objc_setAssociatedObject(self, &pasteImageDelegateKey, pasteImageDelegate, OBJC_ASSOCIATION_ASSIGN);
//}
//
//- (void)paste:(id)sender
//{
//    BOOL isHasUrl   = [[UIPasteboard generalPasteboard] containsPasteboardTypes:UIPasteboardTypeListURL];
//
//    BOOL isHasText  = [[UIPasteboard generalPasteboard] containsPasteboardTypes:UIPasteboardTypeListString];
//    BOOL isHasImage = [[UIPasteboard generalPasteboard] containsPasteboardTypes:UIPasteboardTypeListImage];
//
//    if (isHasImage) {
//        if (self.pasteImageDelegate && [self.pasteImageDelegate respondsToSelector:@selector(textView:pasteImage:)]) {
//            [self.pasteImageDelegate textView:self pasteImage:[UIPasteboard generalPasteboard].image];
//        }
//    } else if(isHasUrl){
//        if (self.pasteImageDelegate && [self.pasteImageDelegate respondsToSelector:@selector(textView:pasteUrl:)]) {
//            [self.pasteImageDelegate textView:self pasteUrl:[UIPasteboard generalPasteboard].URL];
//        }
//    } else if (isHasText){
//        if (self.pasteImageDelegate && [self.pasteImageDelegate respondsToSelector:@selector(textView:pasteString:)]) {
//            [self.pasteImageDelegate textView:self pasteString:[UIPasteboard generalPasteboard].string];
//        }
//    }
//}
//
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
//{
//    //NSLog(@"action: %@", NSStringFromSelector(action));
//    if (action == @selector(paste:) && [UIPasteboard generalPasteboard].image){
//        return YES;
//    }else{
//        if (self.selectedRange.length == 0) {
//            if (   action == @selector(select:)
//                || action == @selector(selectAll:)
//                || action == @selector(paste:)) {
//                return YES;
//            }else{
//                return NO;
//            }
//        }else{
//            NSString * actionStr = NSStringFromSelector(action);
//            if (   action == @selector(cut:)
//                || action == @selector(copy:)
//                || action == @selector(paste:)
//                //------ 私有变量 ------------------------------------------------
//                || [actionStr isEqualToString:@"_addShortcut:"] // 添加快捷短语
//                || [actionStr isEqualToString:@"_transliterateChinese:"] // 简繁转义
//                || [actionStr isEqualToString:@"_share:"] // 分享
//                ) {
//                return YES;
//            }else{
//                return NO;
//            }
//        }
//    }
//}
//
//
//@end
