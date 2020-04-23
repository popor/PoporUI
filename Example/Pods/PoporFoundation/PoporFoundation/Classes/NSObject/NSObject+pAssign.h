//
//  NSObject+pAssign.h
//  PoporFoundation
//
//  Created by apple on 2018/12/13.
//  Copyright © 2018 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (pAssign)

- (void)assignInt:(NSInteger)intValue string:(NSString * _Nullable)string;

// 假如某个string为null或者"", 那么设置为 value
- (void)assignNilString:(NSString * _Nullable)strValue;

- (void)assignIncreaseValue;

@end

NS_ASSUME_NONNULL_END
