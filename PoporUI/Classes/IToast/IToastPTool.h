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

#define AlertToastTitle(title)                                     [IToastPTool alertTitle:title duration:0 copy:NO]

#define AlertToastTitleTime(title, time)                           [IToastPTool alertTitle:title duration:time copy:NO]
#define AlertToastTitleBottom(title, bottom)                       [IToastPTool alertTitle:title b##ottom:bottom]

#define AlertToastTitleTimeBottom(title, time, bottom)             [IToastPTool alertTitle:title duration:time b##ottom:bottom]
#define AlertToastTitleTimeCopy(title, time, isCopy)               [IToastPTool alertTitle:title duration:time copy:isCopy]

#define AlertToastTitleTimeCopyBottom(title, time, isCopy, bottom) [IToastPTool alertTitle:title duration:time copy:isCopy b##ottom:bottom]

@interface IToastPTool : NSObject
// 需要在APP启动之前就增加
+ (IToastPTool *)share;

@property (nonatomic        ) CGFloat keyboardH;
@property (nonatomic        ) CGFloat keyboardH_record;
@property (nonatomic        ) CGFloat bottom;// 用过一次之后销毁, 假如keyboardH大于0, 则忽略bottom参数

+ (void)alertTitle:(NSString *)title;
+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration;

+ (void)alertTitle:(NSString *)title bottom:(CGFloat)bottom;

+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration bottom:(CGFloat)bottom;

+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration copy:(BOOL)copy;

+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration copy:(BOOL)copy bottom:(CGFloat)bottom;

@end
