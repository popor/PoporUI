//
//  NSMutableParagraphStyle+pAtt.h
//  Pods-PoporFoundation_Example
//
//  Created by popor on 2020/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define PAttStyle [NSMutableParagraphStyle new]

@interface NSMutableParagraphStyle (pAtt)

- (NSMutableParagraphStyle *(^)(CGFloat))pLineSpacing;

- (NSMutableParagraphStyle *(^)(NSTextAlignment))pTextAlignment;

- (NSMutableParagraphStyle *)pLineBreakModeDefault;
- (NSMutableParagraphStyle *(^)(NSLineBreakMode))pLineBreakMode;

- (NSMutableParagraphStyle *(^)(CGFloat))pFirstLineHeadIndent;

- (NSMutableParagraphStyle *(^)(CGFloat))pParagraphSpacing;

@end

NS_ASSUME_NONNULL_END
