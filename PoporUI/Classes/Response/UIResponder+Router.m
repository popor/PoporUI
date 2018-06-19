//
//  UIResponder+Router.m
//  NetDemo
//
//  Created by popor on 2017/11/10.
//  Copyright © 2017年 popor. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSLog(@"nextResponder : %@", [self nextResponder]);
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
    
}

@end
