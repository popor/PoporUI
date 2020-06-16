//
//  PoporUIVCProtocol.h
//  PoporUI
//
//  Created by apple on 2019/9/16.
//  Copyright © 2019 wangkq. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: 对外接口
@protocol PoporUIVCProtocol <NSObject>

- (UIViewController *)vc;

// MARK: 自己的
@property (nonatomic, strong) UITableView * infoTV;

// MARK: 外部注入的

@end

// MARK: 数据来源
@protocol PoporUIVCDataSource <NSObject>

@end

// MARK: UI事件
@protocol PoporUIVCEventHandler <NSObject>

- (void)saveLastVCIndex:(NSString *)lastVCIndex;
- (NSString *)getLastVCIndex;
- (void)pushIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
