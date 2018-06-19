//
//  UIPlaceHolderTextView.h
//  WanziTG
//
//  Created by 王凯庆 on 16/9/9.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import <Foundation/Foundation.h>
IB_DESIGNABLE
//IB_DESIGNABLE 让你的自定 UIView 可以在 IB 中预览。
//IBInspectable 让你的自定义 UIView 的属性出现在 IB 中 Attributes inspector 。

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) IBInspectable NSString * placeholder;
@property (nonatomic, retain) IBInspectable UIColor  * placeholderColor;

@property (nonatomic, strong) UILabel * placeHolderLabel;
@property (nonatomic        ) CGPoint placeHolderOrigin;

-(void)textChanged:(NSNotification*)notification;

@end