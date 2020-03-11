//
//  LabelVCPresenter.m
//  PoporUI
//
//  Created by 王凯庆 on 2020/3/10.
//  Copyright © 2020 wangkq. All rights reserved.

#import "LabelVCPresenter.h"
#import "LabelVCInteractor.h"

@interface LabelVCPresenter ()

@property (nonatomic, weak  ) id<LabelVCProtocol> view;
@property (nonatomic, strong) LabelVCInteractor * interactor;

@end

@implementation LabelVCPresenter

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setMyInteractor:(LabelVCInteractor *)interactor {
    self.interactor = interactor;
    
}

- (void)setMyView:(id<LabelVCProtocol>)view {
    self.view = view;
    
}

// 开始执行事件,比如获取网络数据
- (void)startEvent {
    
    
}

#pragma mark - VC_DataSource

#pragma mark - VC_EventHandler

#pragma mark - Interactor_EventHandler

@end
