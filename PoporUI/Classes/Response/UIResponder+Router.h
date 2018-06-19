//
//  UIResponder+Router.h
//  NetDemo
//
//  Created by popor on 2017/11/10.
//  Copyright © 2017年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
