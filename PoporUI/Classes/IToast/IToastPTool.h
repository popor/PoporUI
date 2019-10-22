//
//  IToastPTool.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IToast_Popor.h"

/*
 会根据键盘的高度自动调整吐司位置.
 */

#define AlertToastTitle(title)                       [IToastPTool alertTitle:title duration:0    copy:NO]
#define AlertToastTitleTime(title, time)             [IToastPTool alertTitle:title duration:time copy:NO]
#define AlertToastTitleTimeCopy(title, time, isCopy) [IToastPTool alertTitle:title duration:time copy:isCopy]

@interface IToastPTool : NSObject
// 需要在APP启动之前就增加
+ (IToastPTool *)share;

@property (nonatomic        ) int keyboardH;

+ (void)alertTitle:(NSString *)title;
+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration;

/*
 if (duration == 0 || duration == -1) {
 duration = 2;
 }
 //*/
+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration copy:(BOOL)copy;

@end
