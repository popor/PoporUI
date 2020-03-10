//
//  UITextField+pTextRange.m
//  PoporUI
//
//  Created by popor on 01/03/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import "UITextField+pTextRange.h"

@implementation UITextField (pTextRange)

- (NSRange)selectedRange {
    UITextPosition* beginning      = self.beginningOfDocument;

    UITextRange* selectedRange     = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd   = selectedRange.end;

    // const仅仅用来修饰右边的变量（基本数据变量p，指针变量*p）
    // 被const修饰的变量是只读的。
    NSInteger location       = [self offsetFromPosition:beginning toPosition:selectionStart];
    NSInteger length         = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

// 备注：UITextField必须为第一响应者才有效
- (void)setSelectedRange:(NSRange)range {
    UITextPosition* beginning     = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition   = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange   = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}

@end
