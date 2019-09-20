//
//  UIButton+pLayoutCustom.m
//  Masonry
//
//  Created by apple on 2019/9/20.
//

#import "UIButton+pLayoutCustom.h"
#import <PoporFoundation/NSObject+pSwizzling.h>

@implementation UIButton (pLayoutCustom)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("UIButton") methodSwizzlingWithOriginalSelector:@selector(titleRectForContentRect:) bySwizzledSelector:@selector(titleRectForContentRect_pLayoutCustom:)];
        [objc_getClass("UIButton") methodSwizzlingWithOriginalSelector:@selector(imageRectForContentRect:) bySwizzledSelector:@selector(imageRectForContentRect_pLayoutCustom:)];
    });
}


- (CGRect)titleRectForContentRect_pLayoutCustom:(CGRect)contentRect {
    if (self.titleFrameBlock) {
        return self.titleFrameBlock(contentRect);
    }else{
        return contentRect;
    }
}

- (CGRect)imageRectForContentRect_pLayoutCustom:(CGRect)contentRect {
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

#pragma mark - set get
- (void)setTitleFrameBlock:(Block_pLayoutCustom_frame)titleFrameBlock {
    objc_setAssociatedObject(self, @"titleFrameBlock", titleFrameBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (Block_pLayoutCustom_frame)titleFrameBlock {
    return objc_getAssociatedObject(self, @"titleFrameBlock");
}

- (void)setImageFrameBlock:(Block_pLayoutCustom_frame)imageFrameBlock {
    objc_setAssociatedObject(self, @"imageFrameBlock", imageFrameBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (Block_pLayoutCustom_frame)imageFrameBlock {
    return objc_getAssociatedObject(self, @"imageFrameBlock");
}

@end
