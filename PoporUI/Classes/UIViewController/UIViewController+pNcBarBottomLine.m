//
//  UIViewController+pNcBarBottomLine.m
//  hywj
//
//  Created by popor on 2020/6/11.
//  Copyright © 2020 popor. All rights reserved.
//

#import "UIViewController+pNcBarBottomLine.h"
#import <objc/runtime.h>

@implementation UIViewController (pNcBarBottomLine)
@dynamic ncbarShadowImageDefault;
@dynamic ncbarBgImageDefault;
@dynamic ncbarShadowImageCustom;
@dynamic ncbarBgImageCustom;


- (void)getSystemDefaultImage {
    self.ncbarShadowImageCustom  = [UIImage new];
    self.ncbarBgImageCustom      = [UIImage new];
    self.ncbarShadowImageDefault = self.navigationController.navigationBar.shadowImage;
    self.ncbarBgImageDefault     = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
}

// 隐藏ncBar下面的一条线
- (void)hiddenSystemBottomLine {
    self.navigationController.navigationBar.shadowImage = self.ncbarShadowImageCustom;
    [self.navigationController.navigationBar setBackgroundImage:self.ncbarBgImageCustom forBarMetrics:UIBarMetricsDefault];
}

// 恢复ncBar下面的一条线
- (void)showSystemBottomLine {
    self.navigationController.navigationBar.shadowImage = self.ncbarShadowImageDefault;
    [self.navigationController.navigationBar setBackgroundImage:self.ncbarBgImageDefault forBarMetrics:UIBarMetricsDefault];
}

- (void)setNcbarShadowImageDefault:(UIImage *)ncbarShadowImageDefault {
    objc_setAssociatedObject(self, @"ncbarShadowImageDefault", ncbarShadowImageDefault, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)ncbarShadowImageDefault {
    return objc_getAssociatedObject(self, @"ncbarShadowImageDefault");
}

- (void)setNcbarBgImageDefault:(UIImage *)ncbarBgImageDefault {
    objc_setAssociatedObject(self, @"ncbarBgImageDefault", ncbarBgImageDefault, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)ncbarBgImageDefault {
    return objc_getAssociatedObject(self, @"ncbarBgImageDefault");
}

- (void)setNcbarShadowImageCustom:(UIImage *)ncbarShadowImageCustom {
    objc_setAssociatedObject(self, @"ncbarShadowImageCustom", ncbarShadowImageCustom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)ncbarShadowImageCustom {
    return objc_getAssociatedObject(self, @"ncbarShadowImageCustom");
}

- (void)setNcbarBgImageCustom:(UIImage *)ncbarBgImageCustom {
    objc_setAssociatedObject(self, @"ncbarBgImageCustom", ncbarBgImageCustom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)ncbarBgImageCustom {
    return objc_getAssociatedObject(self, @"ncbarBgImageCustom");
}


@end
