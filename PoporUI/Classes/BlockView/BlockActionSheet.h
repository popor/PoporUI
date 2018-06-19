//
//  BlockActionSheet.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block_ActionSheetAction) (NSInteger buttonIndex);


@interface UIActionSheet(BlockActionSheet)
@property(nonatomic, strong)Block_ActionSheetAction block_ActionSheetAction;

- (void)showInView:(UIView *)view selectActionSheetblock:(Block_ActionSheetAction)block_ActionSheetAction;

@end
