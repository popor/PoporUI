//
//  UITableView+pTransitionCoordinator.m
//  PoporUI
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 popor. All rights reserved.
//

#import "UITableView+pTransitionCoordinator.h"

@implementation UITableView (pTransitionCoordinator)

- (void)transitionCoordinator:(id <UIViewControllerTransitionCoordinator>)transitionCoordinator animated:(BOOL)animated {
    
    NSIndexPath * ip = [self indexPathForSelectedRow];
    if (!ip) {
        return;
    }
    if (transitionCoordinator) {
        [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            [self deselectRowAtIndexPath:ip animated:animated];
            
        } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            if (context.isCancelled) {
                [self selectRowAtIndexPath:ip animated:animated scrollPosition:UITableViewScrollPositionNone];
            }
        }];
    }else{
        [self deselectRowAtIndexPath:ip animated:animated];
    }
    
}

@end
