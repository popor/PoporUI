//
//  UINavigationController+pPush.m
//  PoporUI
//
//  Created by apple on 2018/9/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UINavigationController+pPush.h"

#import <objc/runtime.h>
#import <PoporFoundation/NSObject+pSwizzling.h>

@implementation UINavigationController (pPush)
@dynamic blockPushVC_custom;


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(pushViewController:animated:) bySwizzledSelector:@selector(safePushViewController:animated:)];
    });
}

- (void)safePushViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated {
    if (self.blockPushVC_custom) {
        self.blockPushVC_custom(viewControllerToPresent, animated);
    } else {
        [self safePushViewController:viewControllerToPresent animated:animated];
    }
}

 
- (void)setBlockPushVC_custom:(BlockPushVC_custom)blockPushVC_custom {
    objc_setAssociatedObject(self, @"blockPushVC_custom", blockPushVC_custom, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BlockPushVC_custom)blockPushVC_custom {
    return objc_getAssociatedObject(self, @"blockPushVC_custom");
}

@end
