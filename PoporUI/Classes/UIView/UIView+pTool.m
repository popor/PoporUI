//
//  UIView+pTool.m
//  PoporUI
//
//  Created by popor on 2021/2/20.
//  Copyright © 2021年 popor. All rights reserved.
//

#import "UIView+pTool.h"

@implementation UIView (pTool)

- (void)cleanSelf {
    [self cleanSelfDelay:0];
}

- (void)cleanSelfDelay:(CGFloat)delay {
    delay = delay>0 ? delay:1;
    
    __block UIView * blockView = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [blockView removeFromSuperview];
        blockView = nil;
    });
}

@end
