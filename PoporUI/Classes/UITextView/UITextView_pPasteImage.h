//
//  UITextView_pPasteImage.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UITextView_pPasteImageDelegate <NSObject>

- (void)textView:(UITextView *)textView pasteImage:(UIImage *)image;

@end

@interface UITextView_pPasteImage : UITextView

@property (nonatomic, weak  ) id <UITextView_pPasteImageDelegate> pasteImageDelegate;

// 在firstResponse的情况下,为了显示UIMenuController,也不丢失firstResponse.
// http://stackoverflow.com/questions/8380373/showing-uimenucontroller-loses-keyboard
@property (nonatomic, weak  ) UIResponder *overrideNextResponder;

@end
