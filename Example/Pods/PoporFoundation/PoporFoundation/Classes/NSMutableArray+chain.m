//
//  NSMutableArray+chain.m
//  linRunShengPi
//
//  Created by popor on 2018/3/23.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSMutableArray+chain.h"

@implementation NSMutableArray (chain)

- (NSMutableArray *(^)(NSObject *))add {
    return ^NSMutableArray *(NSObject * object){
        [self addObject:object];
        return self;
    };
}

@end
