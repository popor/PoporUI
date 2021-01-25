//
//  UIViewController+pNcBarBottomLine.m
//  hywj
//
//  Created by popor on 2020/6/11.
//  Copyright © 2020 popor. All rights reserved.
//

#import "UIViewController+pNcBarBottomLine.h"
#import <objc/runtime.h>
#import "UIImage+pCreate.h"
#import "UIImage+pGradient.h"

#pragma mark - NC 部分
@implementation UINavigationController (pNcBarBottomLine)
@dynamic ncbarShadowImageDefault;
@dynamic ncbarShadowImageCustom;

//@dynamic ncbarBgImageDefault;
//@dynamic ncbarBgImageCustom;

//------------------------------------------------------------------------------------
- (void)setNcbarShadowImageDefault:(UIImage *)ncbarShadowImageDefault {
    objc_setAssociatedObject(self, @"ncbarShadowImageDefault", ncbarShadowImageDefault, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)ncbarShadowImageDefault {
    return objc_getAssociatedObject(self, @"ncbarShadowImageDefault");
}

- (void)setNcbarShadowImageCustom:(UIImage *)ncbarShadowImageCustom {
    objc_setAssociatedObject(self, @"ncbarShadowImageCustom", ncbarShadowImageCustom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)ncbarShadowImageCustom {
    return objc_getAssociatedObject(self, @"ncbarShadowImageCustom");
}


//- (void)setNcbarBgImageDefault:(UIImage *)ncbarBgImageDefault {
//    objc_setAssociatedObject(self, @"ncbarBgImageDefault", ncbarBgImageDefault, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIImage *)ncbarBgImageDefault {
//    return objc_getAssociatedObject(self, @"ncbarBgImageDefault");
//}
//
//- (void)setNcbarBgImageCustom:(UIImage *)ncbarBgImageCustom {
//    objc_setAssociatedObject(self, @"ncbarBgImageCustom", ncbarBgImageCustom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIImage *)ncbarBgImageCustom {
//    return objc_getAssociatedObject(self, @"ncbarBgImageCustom");
//}

//------------------------------------------------------------------------------------
- (void)getSystemDefaultImage {
    if (!self.ncbarShadowImageCustom) {
        static UIImage * image;
        if (!image) {
            image = [UIImage imageFromColor:UIColor.clearColor size:CGSizeMake(1, 1)];
        }
        self.ncbarShadowImageCustom = image;
        
        //NSLog(@"self.ncbarShadowImageCustom: %f-%f", self.ncbarShadowImageCustom.size.width, self.ncbarShadowImageCustom.size.height);
    }
    
    if (!self.ncbarShadowImageDefault) {
        UIImage * image = self.navigationBar.shadowImage;
        //NSLog(@"shadowImageDefault. size: %f-%f", image.size.width, image.size.height);
        
        if (!image) {
            image = [UIImage gradientImageWithBounds:CGRectMake(0, 0, 1, 1)
                                           andColors:@[[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.2],
                                                       [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.0]]
                                     gradientHorizon:NO];
            
            self.ncbarShadowImageDefault = image;
        } else {
            self.ncbarShadowImageDefault = image;
        }
    }
    
    //self.ncbarBgImageCustom      = [UIImage new];
    //self.ncbarBgImageDefault     = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
}

@end

#pragma mark - VC 部分
@implementation UIViewController (pNcBarBottomLine)

// 隐藏ncBar下面的一条线
- (void)hiddenSystemBottomLine {
    UINavigationController * nc;
    if ([self isKindOfClass:[UINavigationController class]]) {
        nc = (UINavigationController *)self;
    } else {
        nc = self.navigationController;
    }
    UIImage * image = nc.ncbarShadowImageCustom;
    nc.navigationBar.shadowImage = image;
    //[self.navigationController.navigationBar setBackgroundImage:self.ncbarBgImageCustom forBarMetrics:UIBarMetricsDefault];
}

// 恢复ncBar下面的一条线
- (void)showSystemBottomLine {
    UINavigationController * nc;
    if ([self isKindOfClass:[UINavigationController class]]) {
        nc = (UINavigationController *)self;
    } else {
        nc = self.navigationController;
    }
    
    UIImage * image = nc.ncbarShadowImageDefault;
    nc.navigationBar.shadowImage = image;
    //[self.navigationController.navigationBar setBackgroundImage:self.ncbarBgImageDefault forBarMetrics:UIBarMetricsDefault];
}

@end
