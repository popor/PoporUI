//
//  BlockActionSheet.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "BlockActionSheet.h"
#import <objc/runtime.h>

@interface UIActionSheet()<UIActionSheetDelegate>

@end

@implementation UIActionSheet(BlockActionSheet)

- (void)showInView:(UIView *)view selectActionSheetblock:(Block_ActionSheetAction)block_ActionSheetAction;
{
    self.delegate=self;
    [self showInView:view];
    self.block_ActionSheetAction=block_ActionSheetAction;
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block_ActionSheetAction) {
        self.block_ActionSheetAction(buttonIndex);
    }
}

- (void)setBlock_ActionSheetAction:(Block_ActionSheetAction)block_ActionSheetAction
{
    objc_setAssociatedObject(self, @"block_ActionSheetAction", block_ActionSheetAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Block_ActionSheetAction)block_ActionSheetAction
{
    return objc_getAssociatedObject(self, @"block_ActionSheetAction");
}


@end
