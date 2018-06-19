//
//  BlockAlertView.h
//  WanziTG
//
//  Created by popor on 15/8/28.
//  Copyright (c) 2015年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block_AlertViewAction) (NSInteger buttonIndex);


@interface  UIAlertView(BlockAlertView)
@property(nonatomic, strong)Block_AlertViewAction block_AlertViewAction;

- (void)showWithBlock:(Block_AlertViewAction)block_AlertViewAction;

@end
