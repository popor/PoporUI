//
//  BlockAlertView.m
//  WanziTG
//
//  Created by popor on 15/8/28.
//  Copyright (c) 2015年 wanzi. All rights reserved.
//

#import "BlockAlertView.h"
#import <objc/runtime.h>

@implementation UIAlertView(BlockAlertView)

- (void)showWithBlock:(Block_AlertViewAction)block_AlertViewAction
{
    self.delegate=self;
    [self show];
    self.block_AlertViewAction=block_AlertViewAction;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block_AlertViewAction) {
        self.block_AlertViewAction(buttonIndex);
    }
}

- (void)setBlock_AlertViewAction:(Block_AlertViewAction)block_AlertViewAction
{
    objc_setAssociatedObject(self, @"block_AlertViewAction", block_AlertViewAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Block_AlertViewAction)block_AlertViewAction
{
    return objc_getAssociatedObject(self, @"block_AlertViewAction");
}

@end
