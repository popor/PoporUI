//
//  PasteImageTextView.h
//  WanziTG
//
//  Created by 王凯庆 on 2016/12/23.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIPasteImageTextViewDelegate <NSObject>

- (void)textView:(UITextView *)textView pasteImage:(UIImage *)image;

@end

@interface UIPasteImageTextView : UITextView

@property (nonatomic, weak  ) id <UIPasteImageTextViewDelegate> pasteImageDelegate;

// 在firstResponse的情况下,为了显示UIMenuController,也不丢失firstResponse.
// http://stackoverflow.com/questions/8380373/showing-uimenucontroller-loses-keyboard
@property (nonatomic, weak  ) UIResponder *overrideNextResponder;

@end
