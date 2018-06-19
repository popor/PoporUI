//
//  DispatchTool.h
//  WanziTG
//
//  Created by 王凯庆 on 2016/12/23.
//  Copyright © 2016年 wanzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DispatchTool : NSObject

// 1: http://blog.csdn.net/chaoyuan899/article/details/12554603
+ (void)bgBlock:(void(^)(void))bgBlock mainBlock:(void(^)(void))mainBlock;

@end
