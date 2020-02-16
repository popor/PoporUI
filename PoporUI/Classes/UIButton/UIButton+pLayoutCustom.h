//
//  UIButton+pLayoutCustom.h
//  Masonry
//
//  Created by apple on 2019/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef CGRect(^Block_pLayoutCustom_frame) (UIButton * button, CGRect contentRect);

@interface UIButton (pLayoutCustom)

/*
 至少在iOS13的虚拟机无法正确运行,所以取消这里的方法了.(不适用category, 使用单独定义的UIButton可以正常运行)
@property (nonatomic, copy  ) Block_pLayoutCustom_frame imageFrameBlock;
@property (nonatomic, copy  ) Block_pLayoutCustom_frame titleFrameBlock;

// 最好在设置了image和title之后进行
// 居中显示,图片在文字右边, 算法还有问题.
- (void)layoutHorizon_textImage_:(UIImage *)image title:(NSString *)title font:(UIFont *)font forState:(UIControlState)state;
- (void)layoutHorizon_textImage_:(UIImage *)image att:(NSMutableAttributedString *)att forState:(UIControlState)state;

- (void)layoutHorizon_textImage_:(UIImage *)image titleSize:(CGSize)titleSize forState:(UIControlState)state;

// 靠右显示,图片在文字右边
- (void)layoutHorizon_textImage:(UIImage *)image title:(NSString *)title font:(UIFont *)font forState:(UIControlState)state;
- (void)layoutHorizon_textImage:(UIImage *)image att:(NSMutableAttributedString *)att forState:(UIControlState)state;

- (void)layoutHorizon_textImage:(UIImage *)image titleSize:(CGSize)titleSize forState:(UIControlState)state;

 //*/

@end

NS_ASSUME_NONNULL_END
