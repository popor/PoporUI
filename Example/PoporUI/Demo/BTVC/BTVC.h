//
//  BTVC.h
//  PoporUI_Example
//
//  Created by apple on 2019/9/20.
//  Copyright © 2019 wangkq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 启用setEdgeInsetType: spaceGap: maxWidth 之后
 1.设置 oneBT.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; 会失效.
 2.之后,不能再随便设置width height等参数. (需要在函数接口设定,是否固定width,height.)
 
 */
@interface BTVC : UIViewController

@end

NS_ASSUME_NONNULL_END
