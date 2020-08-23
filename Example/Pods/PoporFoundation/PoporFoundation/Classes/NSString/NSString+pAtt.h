//
//  NSString+pAtt.h
//  PoporFoundation
//
//  Created by popor on 2016/11/8.
//  Copyright © 2016年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Os+pPrefix.h"
#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (pAtt)

+ (NSMutableAttributedString *)underLineAttString:(NSString * _Nullable)string font:(FONT_CLASS * _Nullable)font color:(COLOR_CLASS * _Nullable)color;

@end


NS_ASSUME_NONNULL_END
