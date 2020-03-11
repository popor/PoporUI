//
//  LabelVC.h
//  PoporUI
//
//  Created by 王凯庆 on 2020/3/10.
//  Copyright © 2020 wangkq. All rights reserved.

#import <UIKit/UIKit.h>
#import "LabelVCProtocol.h"

@interface LabelVC : UIViewController <LabelVCProtocol>

- (instancetype)initWithDic:(NSDictionary *)dic;

- (void)addViews;

// 开始执行事件,比如获取网络数据
- (void)startEvent;


@end
