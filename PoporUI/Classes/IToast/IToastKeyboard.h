//
//  WanziRecorderKeyboard.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IToast_Popor.h"

#define AlertToastTitle(title)                       [IToastKeyboard alertTitle:title duration:0    copy:NO]
#define AlertToastTitleTime(title, time)             [IToastKeyboard alertTitle:title duration:time copy:NO]
#define AlertToastTitleTimeCopy(title, time, isCopy) [IToastKeyboard alertTitle:title duration:time copy:isCopy]

@interface IToastKeyboard : NSObject

// 需要在APP启动之前就增加
+ (IToastKeyboard *)shareIToastKeyboard;

@property (nonatomic        ) int keyboardH;

+ (void)alertTitle:(NSString *)title;
+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration;

/*
 if (duration == 0 || duration == -1) {
 duration = 0.5;
 }
 //*/
+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration copy:(BOOL)copy;

@end
