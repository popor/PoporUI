//
//  UIButtonLayoutCustom.h
//  linRunShengPi
//
//  Created by apple on 2018/8/23.
//  Copyright © 2018年 艾慧勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButtonLayoutCustom : UIButton

@property (nonatomic, copy  ) CGRect (^imageFrameBlock)(CGRect contentRect);
@property (nonatomic, copy  ) CGRect (^titleFrameBlock)(CGRect contentRect);


@end
