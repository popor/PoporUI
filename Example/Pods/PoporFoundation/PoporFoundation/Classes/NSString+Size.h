//
//  NSString+Size.h
//  Wanzi
//
//  Created by popor on 2016/10/20.
//  Copyright © 2016年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGSize)sizeInFont:(UIFont *)font;

- (CGSize)sizeInFont:(UIFont *)font width:(float)width;

- (CGSize)sizeAttrSpace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;
@end
