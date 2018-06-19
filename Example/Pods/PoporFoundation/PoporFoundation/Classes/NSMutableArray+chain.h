//
//  NSMutableArray+chain.h
//  linRunShengPi
//
//  Created by popor on 2018/3/23.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (chain)

- (NSMutableArray *(^)(NSObject *))add;

@end
