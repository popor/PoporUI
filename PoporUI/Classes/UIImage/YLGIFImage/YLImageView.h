//
//  YLImageView.h
//  YLGIFImage
//
//  Created by Yong Li on 14-3-2.
//  Copyright (c) 2014年 Yong Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLGIFImage.h"

@interface YLImageView : UIImageView

@property (        nonatomic) BOOL       autoPlay;// 是否允许自动播放
@property (nonatomic        ) NSUInteger     currentFrameIndex;
@property (copy,   nonatomic) NSString   *runLoopMode;
@property (nonatomic        ) NSUInteger loopCountdown;

- (void)playOneLoopFinshBlock:(void(^)(void))finshBlock;

@end
