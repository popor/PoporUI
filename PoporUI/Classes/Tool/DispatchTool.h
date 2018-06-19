//
//  DispatchTool.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DispatchTool : NSObject

// 1: http://blog.csdn.net/chaoyuan899/article/details/12554603
+ (void)bgBlock:(void(^)(void))bgBlock mainBlock:(void(^)(void))mainBlock;

@end
