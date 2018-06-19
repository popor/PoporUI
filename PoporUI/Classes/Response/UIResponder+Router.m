//
//  UIResponder+Router.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSLog(@"nextResponder : %@", [self nextResponder]);
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
    
}

@end
