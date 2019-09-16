//
//  PoporUIVC.h
//  PoporUI
//
//  Created by apple on 2019/9/16.
//  Copyright © 2019 wangkq. All rights reserved.

#import <UIKit/UIKit.h>
#import "PoporUIVCProtocol.h"

@interface PoporUIVC : UIViewController <PoporUIVCProtocol>

- (instancetype)initWithDic:(NSDictionary *)dic;

- (void)addViews;

// 开始执行事件,比如获取网络数据
- (void)startEvent;


@end
