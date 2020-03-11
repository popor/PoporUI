//
//  TfVCPresenter.m
//  PoporUI
//
//  Created by 王凯庆 on 2020/3/11.
//  Copyright © 2020 wangkq. All rights reserved.

#import "TfVCPresenter.h"
#import "TfVCInteractor.h"

@interface TfVCPresenter ()

@property (nonatomic, weak  ) id<TfVCProtocol> view;
@property (nonatomic, strong) TfVCInteractor * interactor;

@end

@implementation TfVCPresenter

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setMyInteractor:(TfVCInteractor *)interactor {
    self.interactor = interactor;
    
}

- (void)setMyView:(id<TfVCProtocol>)view {
    self.view = view;
    
}

// 开始执行事件,比如获取网络数据
- (void)startEvent {
    
    
}

#pragma mark - VC_DataSource

#pragma mark - VC_EventHandler

#pragma mark - Interactor_EventHandler

@end
