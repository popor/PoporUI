//
//  PoporUIVCPresenter.h
//  PoporUI
//
//  Created by apple on 2019/9/16.
//  Copyright © 2019 wangkq. All rights reserved.

#import <Foundation/Foundation.h>
#import "PoporUIVCProtocol.h"

// 处理和View事件
@interface PoporUIVCPresenter : NSObject <PoporUIVCEventHandler, PoporUIVCDataSource, UITableViewDelegate, UITableViewDataSource>

- (void)setMyInteractor:(id)interactor;

- (void)setMyView:(id)view;

// 开始执行事件,比如获取网络数据
- (void)startEvent;

@end
