//
//  NSMutableParagraphStyle+pAtt.m
//  Pods-PoporFoundation_Example
//
//  Created by popor on 2020/8/23.
//

#import "NSMutableParagraphStyle+pAtt.h"

@implementation NSMutableParagraphStyle (pAtt)

- (NSMutableParagraphStyle *(^)(CGFloat))pLineSpacing {
    return ^NSMutableParagraphStyle *(CGFloat lineSpacing) {
        self.lineSpacing = lineSpacing;
        return self;
    };
}

- (NSMutableParagraphStyle *(^)(NSTextAlignment))pTextAlignment {
    return ^NSMutableParagraphStyle *(NSTextAlignment textAlignment) {
        [self setAlignment:textAlignment];
        return self;
    };
}

- (NSMutableParagraphStyle *)pLineBreakModeDefault {
    return self.pLineBreakMode(NSLineBreakByTruncatingTail);
}

- (NSMutableParagraphStyle *(^)(NSLineBreakMode))pLineBreakMode {
    return ^NSMutableParagraphStyle *(NSLineBreakMode lineBreakMode) {
        [self setLineBreakMode:lineBreakMode];
        return self;
    };
}

- (NSMutableParagraphStyle *(^)(CGFloat))pFirstLineHeadIndent {
    return ^NSMutableParagraphStyle *(CGFloat firstLineHeadIndent) {
        [self setFirstLineHeadIndent:firstLineHeadIndent];
        return self;
    };
}

- (NSMutableParagraphStyle *(^)(CGFloat))pParagraphSpacing {
    return ^NSMutableParagraphStyle *(CGFloat paragraphSpacing) {
        [self setParagraphSpacing:paragraphSpacing];
        return self;
    };
}

@end
