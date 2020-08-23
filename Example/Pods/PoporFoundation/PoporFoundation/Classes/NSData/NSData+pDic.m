//
//  NSData+pDic.m
//  PoporFoundation
//
//  Created by popor on 2018/5/22.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSData+pDic.h"

@implementation NSData (pDic)

- (NSDictionary *)toDic {
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:nil];
}

@end
