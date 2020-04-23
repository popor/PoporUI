//
//  UINavigationController+pSize.m
//  PoporUI
//
//  Created by apple on 2019/2/27.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UINavigationController+pSize.h"
#import <objc/runtime.h>

@implementation UINavigationController (pSize)
@dynamic barHeight;
@dynamic _initBarHeight;

- (NSInteger)fetchBarHeight {
    NSInteger top;
    if (self.navigationBar.translucent) {
        //self.navigationItem.
        if (@available(iOS 11.0, *)) {
            UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
            if (mainWindow.safeAreaInsets.top > 20.0) {
                top = self.navigationBar.frame.size.height + mainWindow.safeAreaInsets.top;
            }else{
                top = 64;
            }
            
        }else{
            top = 64;
        }
    }else{
        top = 0;
    }
    self.barHeight = top;
    return top;
}

- (void)setBarHeight:(NSInteger)barHeight {
    objc_setAssociatedObject(self, @"barHeight", @(barHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)barHeight {
    if (self._initBarHeight) {
        NSNumber * n = objc_getAssociatedObject(self, @"barHeight");
        return n.integerValue;
    }else{
        self._initBarHeight = YES;
        NSInteger top = [self fetchBarHeight];
        [self setBarHeight:top];
        return top;
    }
}

- (void)set_initBarHeight:(BOOL)_initBarHeight {
    objc_setAssociatedObject(self, @"_initBarHeight", @(_initBarHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)_initBarHeight {
    NSNumber * n = objc_getAssociatedObject(self, @"_initBarHeight");
    return n.boolValue;
}

@end
