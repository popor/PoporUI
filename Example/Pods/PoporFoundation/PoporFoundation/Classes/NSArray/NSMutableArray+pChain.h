//
//  NSMutableArray+pChain.h
//  PoporFoundation
//
//  Created by popor on 2018/3/23.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (pChain)

- (NSMutableArray *(^)(NSObject *))add;

- (NSMutableArray *(^)(NSArray *))adds;

@end

NS_ASSUME_NONNULL_END
