//
//  WanziRecorderKeyboard.h
//  Wanzi
//
//  Created by 王凯庆 on 2016/11/16.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IToast.h"


#define AlertToastTitle(title)              [IToastKeyboard alertToastTitle:title]
#define AlertToastTitleTime(title, time)    [IToastKeyboard alertToastTitle:title duration:time]
#define AlertToastTitleCopy(title)          [IToastKeyboard alertToastTitleCopy:title]

@interface IToastKeyboard : NSObject

// 需要在APP启动之前就增加
+ (IToastKeyboard *)shareIToastKeyboard;

@property (nonatomic        ) int keyboardH;

+ (void)alertToastTitle:(NSString *)title;
+ (void)alertToastTitle:(NSString *)title duration:(NSInteger)duration;
+ (void)alertToastTitleCopy:(NSString *)title;

@end
