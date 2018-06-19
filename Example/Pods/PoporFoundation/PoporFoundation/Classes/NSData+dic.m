//
//  NSData+dic.m
//  linRunShengPi
//
//  Created by popor on 2018/5/22.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSData+dic.h"

@implementation NSData (dic)

- (NSDictionary *)toDic {
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:nil];
}

@end
