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

    const NSInteger location       = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length         = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition* beginning     = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition   = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange   = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}

@end
