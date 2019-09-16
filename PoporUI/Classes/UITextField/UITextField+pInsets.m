//
//  UITextField+pInsets.m
//  Masonry
//
//  Created by apple on 2019/9/16.
//

#import "UITextField+pInsets.h"
#import "NSObject+pSwizzling.h"

@implementation UITextField (pInsets)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("UITextField") methodSwizzlingWithOriginalSelector:@selector(textRectForBounds:) bySwizzledSelector:@selector(textRectForBounds_pInsets:)];
        [objc_getClass("UITextField") methodSwizzlingWithOriginalSelector:@selector(editingRectForBounds:) bySwizzledSelector:@selector(editingRectForBounds_pInsets:)];
    });
}

//控制文本所在的的位置，左右缩 10
- (CGRect)textRectForBounds_pInsets:(CGRect)bounds {
    if (UIEdgeInsetsEqualToEdgeInsets(self.textInset, UIEdgeInsetsZero)) {
        return [self textRectForBounds_pInsets:bounds];
    } else {
        return UIEdgeInsetsInsetRect(bounds, self.textInset);
    }
}

//控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds_pInsets:(CGRect)bounds {
    if (UIEdgeInsetsEqualToEdgeInsets(self.textInset, UIEdgeInsetsZero)) {
        return [self editingRectForBounds_pInsets:bounds];
    } else {
        return UIEdgeInsetsInsetRect(bounds, self.textInset);
    }
}

#pragma mark - set get
- (void)setTextInset:(UIEdgeInsets)textInset {
    NSString * text = NSStringFromUIEdgeInsets(textInset);
    objc_setAssociatedObject(self, @"textInset", text, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)textInset {
    NSString * text =  objc_getAssociatedObject(self, @"textInset");
    return UIEdgeInsetsFromString(text);
}
@end
