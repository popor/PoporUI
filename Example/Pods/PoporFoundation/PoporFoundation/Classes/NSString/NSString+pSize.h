//
//  NSString+pSize.h
//  PoporFoundation
//
//  Created by popor on 2016/10/20.
//  Copyright © 2016年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Os+pPrefix.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (pSize)

- (CGSize)sizeInFont:(FONT_CLASS * _Nonnull)font;

- (CGSize)sizeInFont:(FONT_CLASS * _Nonnull)font width:(CGFloat)width;

- (CGSize)sizeAttrSpace:(CGFloat)lineSpeace withFont:(FONT_CLASS * _Nonnull)font withWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
