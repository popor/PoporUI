//
//  TfVCProtocol.h
//  PoporUI
//
//  Created by 王凯庆 on 2020/3/11.
//  Copyright © 2020 wangkq. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: 对外接口
@protocol TfVCProtocol <NSObject>

- (UIViewController *)vc;

// MARK: 自己的

// MARK: 外部注入的

@end

// MARK: 数据来源
@protocol TfVCDataSource <NSObject>

@end

// MARK: UI事件
@protocol TfVCEventHandler <NSObject>

@end

NS_ASSUME_NONNULL_END
