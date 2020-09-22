//
//  UINavigationController+pPush.h
//  PoporUI
//
//  Created by apple on 2018/9/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BlockPushVC_custom)(UIViewController * pushVC, BOOL animated);

@interface UINavigationController (pPush)

@property (nonatomic, copy  ) BlockPushVC_custom blockPushVC_custom;

@end

NS_ASSUME_NONNULL_END
