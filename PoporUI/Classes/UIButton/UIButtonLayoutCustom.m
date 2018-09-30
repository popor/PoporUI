//
//  UIButtonLayoutCustom.m
//  linRunShengPi
//
//  Created by apple on 2018/8/23.
//  Copyright © 2018年 艾慧勇. All rights reserved.
//

#import "UIButtonLayoutCustom.h"
//
//@implementation UIButtonLayoutTool
//
//+ (instancetype)share {
//    static dispatch_once_t once;
//    static id instance;
//    dispatch_once(&once, ^{
//        instance = [self new];
//
//    });
//    return instance;
//}
//
//@end

@implementation UIButtonLayoutCustom

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    UIButtonLayoutCustom * oneBT = [super buttonWithType:buttonType];
    
    return oneBT;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (self.titleFrameBlock) {
        return self.titleFrameBlock(contentRect);
    }else{
        return contentRect;
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (self.imageFrameBlock) {
        return self.imageFrameBlock(contentRect);
    }else{
        if (self.currentImage) {
            return CGRectMake(0, (contentRect.size.height - self.currentImage.size.height)/2, self.currentImage.size.width, self.currentImage.size.height);
        }else{
            return contentRect;
        }
    }
}

@end
