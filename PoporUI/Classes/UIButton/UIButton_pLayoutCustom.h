//
//  UIButton_pLayoutCustom.h
//  PoporUI
//
//  Created by apple on 2018/8/23.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton_pLayoutCustom : UIButton

@property (nonatomic, copy  ) CGRect (^imageFrameBlock)(CGRect contentRect);
@property (nonatomic, copy  ) CGRect (^titleFrameBlock)(CGRect contentRect);


@end
