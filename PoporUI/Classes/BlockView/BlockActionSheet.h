//
//  BlockActionSheet.h
//  WanziTG
//
//  Created by popor on 15/9/8.
//  Copyright (c) 2015年 wanzi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block_ActionSheetAction) (NSInteger buttonIndex);


@interface UIActionSheet(BlockActionSheet)
@property(nonatomic, strong)Block_ActionSheetAction block_ActionSheetAction;

- (void)showInView:(UIView *)view selectActionSheetblock:(Block_ActionSheetAction)block_ActionSheetAction;

@end
