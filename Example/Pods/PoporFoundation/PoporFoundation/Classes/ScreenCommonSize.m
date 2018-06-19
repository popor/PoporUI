//
//  ScreenCommonSize.m
//  linRunShengPi
//
//  Created by popor on 2018/3/27.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "ScreenCommonSize.h"
@import UIKit;

@implementation ScreenCommonSize


+ (instancetype)share {
    static ScreenCommonSize *shareScreenCommonSize = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareScreenCommonSize = [self new];
        [shareScreenCommonSize setPropertyValue];
    });
    return shareScreenCommonSize;
}



- (void)setPropertyValue {
    
    self.statusSize = [[UIApplication sharedApplication] statusBarFrame].size;
    
    self.phoneX = (self.statusSize.height != 20.f);
    
    self.navBarHeight = (self.isPhoneX ? 88.f : 64.f);
    
    self.tabbarSafeBottomMargin = (self.isPhoneX ? 34.f : 0.f);
    
    
}


@end
