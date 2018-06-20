//
//  UITextField+MaxLength.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UITextField+MaxLength.h"

@implementation UITextField (MaxLength)

//// 这个不需要手动移除,但是需要RAC支持
//- (void)addRacMaxLength:(int)maxLength Block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock {
//    __weak typeof(self) weakSelf = self;
//    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidChangeNotification object:nil] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * _Nullable x) {
//        NSLog(@"TF 最大文字 %@", x);
//        [weakSelf textFieldMaxLength:maxLength block:textFieldBlock];
//    }];
//}

// 这个需要手动移除
+ (void)addNormalDidChangeNCTarget:(id)target action:(SEL)action
{
    [[NSNotificationCenter defaultCenter] addObserver:target selector:action name:UITextFieldTextDidChangeNotification object:nil];
}

+ (void)removeDidChangeNCTarget:(id)target
{
    [[NSNotificationCenter defaultCenter] removeObserver:target name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)textFieldMaxLength:(int)maxLength block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self delayML:maxLength block:textFieldBlock];
    });
}

- (void)delayML:(int)maxLength block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock
{
    NSString *toBeString = self.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position   = [self positionFromPosition:selectedRange.start offset:0];
    //    NSLog(@"1 selectedRange: %@", selectedRange.description);
    //    NSLog(@"1.1 selectedRange: %i", selectedRange.isEmpty);
    //    NSLog(@"2 position     : %@", position.description);
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (position) {
        // NSLog(@"输入中");
        textFieldBlock(YES, NO);
    }else{
        if (toBeString.length > maxLength) {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
            if (rangeIndex.length == 1){
                // 最后结尾普通字体的话
                self.text = [toBeString substringToIndex:maxLength];
                // NSLog(@"越界 普通结尾");
            }else{
                // 最后结尾是表情的话
                // NSLog(@"越界 表情结尾");
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                self.text = [toBeString substringWithRange:rangeRange];
            }
            textFieldBlock(NO, YES);
        }else{
            // NSLog(@"正常");
            textFieldBlock(NO, NO);
        }
    }
}

- (NSRange) selectedRange
{
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void) setSelectedRange:(NSRange) range  // 备注：UITextField必须为第一响应者才有效
{
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}

@end
