//
//  WanziRecorderKeyboard.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
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
