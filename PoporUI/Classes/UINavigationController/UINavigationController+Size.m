//
//  UINavigationController+Size.m
//  Pods-PoporUI_Example
//
//  Created by apple on 2019/2/27.
//

#import "UINavigationController+Size.h"
#import <objc/runtime.h>

@implementation UINavigationController (Size)
@dynamic topMargin;

- (int)getTopMargin {
    if (self.navigationBar.translucent) {
        //self.navigationItem.
        if (@available(iOS 11.0, *)) {
            UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
            if (mainWindow.safeAreaInsets.top > 20.0) {
                return self.navigationBar.frame.size.height + mainWindow.safeAreaInsets.top;
            }else{
                return 64;
            }
            
        }else{
            return 64;
        }
    }else{
        return 0;
    }
}

- (void)setTopMargin:(int)topMargin {
    objc_setAssociatedObject(self, @"topMargin", @(topMargin), OBJC_ASSOCIATION_RETAIN);
}

- (int)topMargin {
    NSNumber * n = objc_getAssociatedObject(self, @"topMargin");
    return n.intValue;
}

@end
