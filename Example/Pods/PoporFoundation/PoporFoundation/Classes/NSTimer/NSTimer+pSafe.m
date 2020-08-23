//
//  NSTimer+pSafe.m
//  PoporFoundation
//
//  Created by popor on 2018/4/21.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSTimer+pSafe.h"

@implementation NSTimer (pSafe)

- (void)dealloc {
    NSLog(@"NSTimer (pSafe) : %s", __func__);
}

+ (NSTimer *)safe_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                           block:(void(^)(void))block
                                         repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(safe_blockInvoks:) userInfo:[block copy] repeats:repeats];
}

+ (void)safe_blockInvoks:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    
    if (block) {
        block();
    }
}

@end
