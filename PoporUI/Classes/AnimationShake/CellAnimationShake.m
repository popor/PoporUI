//
//  CellAnimationShake.m
//  hywj
//
//  Created by popor on 2021/1/8.
//  Copyright © 2021 popor. All rights reserved.
//

#import "CellAnimationShake.h"

@implementation CellAnimationShake

+ (instancetype)share {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
        
    });
    return instance;
}

@end
