//
//  NSMutableArray+pChain.m
//  PoporFoundation
//
//  Created by popor on 2018/3/23.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSMutableArray+pChain.h"

@implementation NSMutableArray (pChain)

- (NSMutableArray *(^)(NSObject *))add {
    return ^NSMutableArray *(NSObject * object){
        [self addObject:object];
        return self;
    };
}

- (NSMutableArray *(^)(NSArray *))adds {
    return ^NSMutableArray *(NSArray * array){
        [self addObjectsFromArray:array];
        return self;
    };
}

@end
