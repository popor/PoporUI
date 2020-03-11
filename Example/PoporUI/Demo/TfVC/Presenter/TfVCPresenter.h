//
//  TfVCPresenter.h
//  PoporUI
//
//  Created by 王凯庆 on 2020/3/11.
//  Copyright © 2020 wangkq. All rights reserved.

#import <Foundation/Foundation.h>
#import "TfVCProtocol.h"

// 处理和View事件
@interface TfVCPresenter : NSObject <TfVCEventHandler, TfVCDataSource>

- (void)setMyInteractor:(id)interactor;

- (void)setMyView:(id)view;

// 开始执行事件,比如获取网络数据
- (void)startEvent;

@end
