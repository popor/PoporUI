//
//  UIViewController+pPresentVC.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIViewController+pPresentVC.h"

#import <objc/runtime.h>
#import <PoporFoundation/NSObject+pSwizzling.h>
#import <PoporFoundation/Fun+pPrefix.h>

@implementation UIViewController (pPresentVC)
@dynamic blockPresentVC_custom;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(presentViewController:animated:completion:) bySwizzledSelector:@selector(safePresentViewController:animated:completion:)];
    });
}

- (void)safePresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^ __nullable)(void))completion {
    if (self.blockPresentVC_custom) {
        self.blockPresentVC_custom(viewControllerToPresent, flag, completion);
    } else {
        if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
            UIAlertController * ac = (UIAlertController *)viewControllerToPresent;
            if (ac.preferredStyle == UIAlertControllerStyleActionSheet) {
                if (PIsIpadDevice) {
                    UIPopoverPresentationController *popPresenter = [ac popoverPresentationController];
                    if (!popPresenter.sourceView) {
                        popPresenter.sourceView = self.view;
                        popPresenter.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 50, 1, 1);
                    }
                }
            }
        }
        [self safePresentViewController:viewControllerToPresent animated:flag completion:completion];
    }
}

- (void)setBlockPresentVC_custom:(BlockPresentVC_custom)blockPresentVC_custom {
    objc_setAssociatedObject(self, @"blockPresentVC_custom", blockPresentVC_custom, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BlockPresentVC_custom)blockPresentVC_custom {
    return objc_getAssociatedObject(self, @"blockPresentVC_custom");
}

@end
