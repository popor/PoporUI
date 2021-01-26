//
//  CcAnimationShake.m
//  hywj
//
//  Created by popor on 2020/12/26.
//  Copyright © 2020 popor. All rights reserved.
//

#import "CcAnimationShake.h"

@implementation CcAnimationShake

+ (instancetype)share {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
        
    });
    return instance;
}

@end
