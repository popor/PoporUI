//
//  UIButton+pLayoutCustom.h
//  Masonry
//
//  Created by apple on 2019/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef CGRect(^Block_pLayoutCustom_frame) (CGRect contentRect);

@interface UIButton (pLayoutCustom)

@property (nonatomic, copy  ) Block_pLayoutCustom_frame imageFrameBlock;
@property (nonatomic, copy  ) Block_pLayoutCustom_frame titleFrameBlock;

@end

NS_ASSUME_NONNULL_END
