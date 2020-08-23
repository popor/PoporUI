//
//  NSDecimalNumber+pChain.m
//  PoporFoundation
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSDecimalNumber+pChain.h"

@implementation NSDecimalNumber (pChain)

- (NSDecimalNumber *(^)(NSDecimalNumber *))add {
    return ^NSDecimalNumber *(NSDecimalNumber * number){
        return [self decimalNumberByAdding:number];
    };
}

- (NSDecimalNumber *(^)(NSDecimalNumber *))sub {
    return ^NSDecimalNumber *(NSDecimalNumber * number){
        return [self decimalNumberBySubtracting:number];
    };
}

- (NSDecimalNumber *(^)(NSDecimalNumber *))mul {
    return ^NSDecimalNumber *(NSDecimalNumber * number){
        return [self decimalNumberByMultiplyingBy:number];
    };
}

- (NSDecimalNumber *(^)(NSDecimalNumber *))div {
    return ^NSDecimalNumber *(NSDecimalNumber * number){
        return [self decimalNumberByDividingBy:number];
    };
}

- (NSDecimalNumber *(^)(id <NSDecimalNumberBehaviors>))behavior {
    return ^NSDecimalNumber *(id <NSDecimalNumberBehaviors> behaviors){
        return [self decimalNumberByRoundingAccordingToBehavior:behaviors];
    };
}


@end
