//
//  UIViewController+pPresentVC.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BlockPresentVC_void)(void);
typedef void(^BlockPresentVC_custom)(UIViewController * presentVC, BOOL animated, BlockPresentVC_void completion);

//typedef void(^BlockPresentVC_custom1)(UIViewController * presentVC, BOOL animated, void (^void)(void)finish);

@interface UIViewController (pPresentVC)

@property (nonatomic, copy  ) BlockPresentVC_custom blockPresentVC_custom;

@end
