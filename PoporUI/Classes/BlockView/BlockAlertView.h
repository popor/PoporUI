//
//  BlockAlertView.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block_AlertViewAction) (NSInteger buttonIndex);


@interface  UIAlertView(BlockAlertView)
@property(nonatomic, strong)Block_AlertViewAction block_AlertViewAction;

- (void)showWithBlock:(Block_AlertViewAction)block_AlertViewAction;

@end
