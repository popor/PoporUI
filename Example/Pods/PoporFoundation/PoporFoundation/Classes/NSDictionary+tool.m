//
//  NSDictionary+tool.m
//  linRunShengPi
//
//  Created by popor on 2018/3/28.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSDictionary+tool.h"

@implementation NSDictionary (tool)

- (NSString *)toJsonString {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
