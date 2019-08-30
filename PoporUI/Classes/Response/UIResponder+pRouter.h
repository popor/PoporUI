//
//  UIResponder+pRouter.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

//  感觉是一个非常冗余的功能,可以用block代替.
#import <UIKit/UIKit.h>

@interface UIResponder (pRouter)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
