//
//  NSString+pIDCard.h
//  PoporFoundation
//
//  Created by popor on 2018/1/5.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSString (pIDCard)

- (BOOL)isChinaIdCardNoLength;
- (BOOL)isChinaIdCardNo;

- (NSString *)chinaIdcardLastCode;

@end

NS_ASSUME_NONNULL_END
