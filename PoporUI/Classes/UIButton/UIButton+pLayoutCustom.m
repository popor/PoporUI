//
//  UIButton+pLayoutCustom.m
//  Masonry
//
//  Created by apple on 2019/9/20.
//

#import "UIButton+pLayoutCustom.h"
#import <PoporFoundation/NSObject+pSwizzling.h>
#import <PoporFoundation/NSString+pSize.h>
#import <PoporFoundation/NSString+pAtt.h>

@implementation UIButton (pLayoutCustom)

/*
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("UIButton") methodSwizzlingWithOriginalSelector:@selector(titleRectForContentRect:) bySwizzledSelector:@selector(titleRectForContentRect_pLayoutCustom:)];
        [objc_getClass("UIButton") methodSwizzlingWithOriginalSelector:@selector(imageRectForContentRect:) bySwizzledSelector:@selector(imageRectForContentRect_pLayoutCustom:)];
    });
}

- (CGRect)titleRectForContentRect_pLayoutCustom:(CGRect)contentRect {
    if (self.titleFrameBlock) {
        return self.titleFrameBlock(self, contentRect);
    }else{
        return [self titleRectForContentRect_pLayoutCustom:contentRect];
    }
}

- (CGRect)imageRectForContentRect_pLayoutCustom:(CGRect)contentRect {
    if (self.imageFrameBlock) {
        return self.imageFrameBlock(self, contentRect);
    }else{
        return [self imageRectForContentRect_pLayoutCustom:contentRect];
    }
}

#pragma mark -  居中显示,图片在文字右边
- (void)layoutHorizon_textImage_:(UIImage *)image title:(NSString *)title font:(UIFont *)font forState:(UIControlState)state {
    
    CGSize titleSize = [title sizeInFont:font];
    //NSLog(@"titleSize: %@", NSStringFromCGSize(titleSize));
    [self layoutHorizon_textImage_:image titleSize:titleSize forState:state];
    
    {
        [self setImage:image forState:state];
        [self setTitle:title forState:state];
        self.titleLabel.font = font;
    }
}

- (void)layoutHorizon_textImage_:(UIImage *)image att:(NSMutableAttributedString *)att forState:(UIControlState)state {
    CGSize titleSize = [att sizeWithWidth:MAXFLOAT];
    [self layoutHorizon_textImage_:image titleSize:titleSize forState:state];
    {
        [self setAttributedTitle:att forState:state];
        [self setImage:image forState:state];
    }
}

- (void)layoutHorizon_textImage_:(UIImage *)image titleSize:(CGSize)titleSize forState:(UIControlState)state {
    
    __block CGSize imageSize  = CGSizeZero;
    
    self.imageFrameBlock = ^CGRect(UIButton * button, CGRect contentRect) {
        if (CGSizeEqualToSize(CGSizeZero, imageSize)) {
            imageSize = [UIButton imageMaxSize:image contentRect:contentRect];
        }
        
        int x = (contentRect.size.width - titleSize.width - imageSize.width)/2 + titleSize.width;
        CGRect rect = CGRectMake(x, (contentRect.size.height - imageSize.height)/2, imageSize.width, imageSize.height);
        
        //NSLog(@"image rect: %@, content: %@", NSStringFromCGRect(rect), NSStringFromCGRect(contentRect));
        return rect;
    };
    self.titleFrameBlock = ^CGRect(UIButton * button, CGRect contentRect) {
        if (CGSizeEqualToSize(CGSizeZero, imageSize)) {
            imageSize = [UIButton imageMaxSize:image contentRect:contentRect];
        }
        
        int x = (contentRect.size.width - titleSize.width - imageSize.width)/2;
        CGRect rect = CGRectMake(x, 0, titleSize.width, contentRect.size.height);
        
        //NSLog(@"title rect: %@, content: %@", NSStringFromCGRect(rect), NSStringFromCGRect(contentRect));
        return rect;
    };
}

#pragma mark - 靠右显示,图片在文字右边
- (void)layoutHorizon_textImage:(UIImage *)image title:(NSString *)title font:(UIFont *)font forState:(UIControlState)state {
    
    CGSize titleSize = [title sizeInFont:font];
    [self layoutHorizon_textImage:image titleSize:titleSize forState:state];
    
    {
        [self setTitle:title forState:state];
        self.titleLabel.font = font;
        [self setImage:image forState:state];
    }
}

- (void)layoutHorizon_textImage:(UIImage *)image att:(NSMutableAttributedString *)att forState:(UIControlState)state {
    
    CGSize titleSize = [att sizeWithWidth:MAXFLOAT];
    [self layoutHorizon_textImage:image titleSize:titleSize forState:state];
    
    {
        [self setAttributedTitle:att forState:state];
        [self setImage:image forState:state];
    }
}

- (void)layoutHorizon_textImage:(UIImage *)image titleSize:(CGSize)titleSize forState:(UIControlState)state {
    
    __block CGSize imageSize  = CGSizeZero;
    
    self.imageFrameBlock = ^CGRect(UIButton * button, CGRect contentRect) {
        if (CGSizeEqualToSize(CGSizeZero, imageSize)) {
            imageSize = [UIButton imageMaxSize:image contentRect:contentRect];
        }
        
        return CGRectMake(contentRect.size.width - imageSize.width, 0, imageSize.width, imageSize.height);
    };
    self.titleFrameBlock = ^CGRect(UIButton * button, CGRect contentRect) {
        if (CGSizeEqualToSize(CGSizeZero, imageSize)) {
            imageSize = [UIButton imageMaxSize:image contentRect:contentRect];
        }
        
        return CGRectMake(0, 0, contentRect.size.width - imageSize.width, contentRect.size.height);
    };
}

#pragma mark - tool
+ (CGSize)imageMaxSize:(UIImage *)image contentRect:(CGRect)contentRect {
    if (contentRect.size.width > image.size.width || contentRect.size.height > image.size.height) {
        float s1 = contentRect.size.width/image.size.width;
        float s2 = contentRect.size.height/image.size.height;
        
        if (s1 <= s2) {
            return CGSizeMake(image.size.width * s1, image.size.height * s1);
        } else {
            return CGSizeMake(image.size.width * s2, image.size.height * s2);
        }
    } else {
        return image.size;
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

 */

@end
