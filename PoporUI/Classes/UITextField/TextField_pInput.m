//
//  TextField_pInput.m
//  hywj
//
//  Created by popor on 2020/6/28.
//  Copyright © 2020 popor. All rights reserved.
//

#import "TextField_pInput.h"

#import <PoporFoundation/NSString+pTool.h>
#import <PoporFoundation/NSString+pIDCard.h>
#import <PoporUI/UITextField+pFormat.h>

static NSString * PicMoneyNumbers  = @"0123456789.";
static NSString * PicPhoneNumbers  = @"0123456789";
static NSString * PicIdcardNumbers = @"0123456789Xx";

@interface TextField_pInput () <UITextFieldDelegate>

@property (nonatomic        ) int maxLength;
@property (nonatomic, copy  ) TextField_pInput_BlockInt maxBlock;

@end

@implementation TextField_pInput

- (id)init {
    if (self = [super init]) {
        self.delegate = self;
        self.textGapUnit = 6;
        self.fractionalNumber = 2;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - tf事件类型
- (void)setTfTypeNumberInt {
    self.secureTextEntry = NO;
    self.keyboardType    = UIKeyboardTypeNumberPad;
    self.tfType             = TextField_pInputType_NumberInt;
}

- (void)setTfTypeNumberFloat {
    [self setTfTypeNumberFloat_fractional:2];
}

// 小数点个数
- (void)setTfTypeNumberFloat_fractional:(NSInteger)number {
    self.secureTextEntry = NO;
    self.keyboardType    = UIKeyboardTypeDecimalPad;
    self.tfType          = TextField_pInputType_NumberFloat;
    
    self.fractionalNumber = number;
}

- (void)setTfTypePhone {
    self.tfType = TextField_pInputType_Phone;
    self.secureTextEntry = NO;
    //self.tf.clearButtonMode = UITextFieldViewModeAlways;
    //self.tf.keyboardType    = UIKeyboardTypePhonePad; // 系统的电话键盘
    self.keyboardType    = UIKeyboardTypeNumberPad;  // 系统或第三方的数字键盘
}

- (void)setTfTypeMoneyFloat {
    [self setTfTypeMoneyFloat_fractional:2];
}

// 小数点个数
- (void)setTfTypeMoneyFloat_fractional:(NSInteger)number {
    self.tfType = TextField_pInputType_MoneyFloat;
    self.secureTextEntry = NO;
    self.keyboardType    = UIKeyboardTypeDecimalPad;  // 系统或第三方的数字键盘
    
    self.fractionalNumber = number;
}

- (void)setTfTypeMoneyInt{
    self.tfType = TextField_pInputType_MoneyInt;
    self.secureTextEntry = NO;
    self.keyboardType    = UIKeyboardTypeNumberPad;  // 系统或第三方的数字键盘
}

- (void)setTfTypePassword {
    self.tfType = TextField_pInputType_Password;
    self.secureTextEntry = YES;
    self.keyboardType    = UIKeyboardTypeDefault;
}

- (void)setTfTypeBank {
    self.tfType = TextField_pInputType_Bank;
    self.secureTextEntry = NO;
    self.keyboardType    = UIKeyboardTypeNumberPad;  // 系统或第三方的数字键盘
}

// 省份证格式
- (void)setTfTypeIdcard {
    self.tfType = TextField_pInputType_Idcard;
    self.secureTextEntry = NO;
    self.keyboardType    = UIKeyboardTypeNumberPad;  // 系统或第三方的数字键盘
    self.maxLength          = 18;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.editTFEnableBlock) {
        return self.editTFEnableBlock(self);
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *cs;
    switch (self.tfType) {
        case TextField_pInputType_NumberInt: {
            cs = [[NSCharacterSet characterSetWithCharactersInString:PicPhoneNumbers] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest){
                return NO;
            }
            break;
        }
        case TextField_pInputType_NumberFloat: {
            cs = [[NSCharacterSet characterSetWithCharactersInString:PicMoneyNumbers] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest){
                return NO;
            }
            
            NSString * tString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            // 只允许一个小数点
            NSInteger pointNumber = [tString countOccurencesOfString:@"."];
            if (pointNumber > 1) {
                return NO;
            } else if (pointNumber == 1) {
                NSRange pointRange = [tString rangeOfString:@"."];
                if (tString.length - pointRange.location > self.fractionalNumber+1) {
                    return NO;
                }
            }
            
            break;
        }
        case TextField_pInputType_Password:{
            NSString * tempString=string;
            tempString = [tempString replaceWithREG:@" " newString:@""];
            if (![tempString isEqualToString:string]) {
                return NO;
            }
            break;
        }
        case TextField_pInputType_Phone:{
            cs = [[NSCharacterSet characterSetWithCharactersInString:PicPhoneNumbers] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest){
                return NO;
            }
            if ([textField.text stringByReplacingCharactersInRange:range withString:string].length>11) {
                return NO;
            }
            // 使用延迟事件会在切换TF的时候 出现异常
            dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [textField formatChinaPhone];
                });
            });
            break;
        }
        case TextField_pInputType_MoneyInt:{
            cs = [[NSCharacterSet characterSetWithCharactersInString:PicPhoneNumbers] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest){
                return NO;
            }
            // 使用延迟事件会在切换TF的时候 出现异常
            dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [textField formatMoneyUnit:self.textGapUnit];
                });
            });
            break;
        }
        case TextField_pInputType_MoneyFloat:{
            cs = [[NSCharacterSet characterSetWithCharactersInString:PicMoneyNumbers] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest){
                return NO;
            }
            NSString * tString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            // 只允许一个小数点
            NSInteger pointNumber = [tString countOccurencesOfString:@"."];
            if (pointNumber > 1) {
                return NO;
            } else if (pointNumber == 1) {
                NSRange pointRange = [tString rangeOfString:@"."];
                if (tString.length - pointRange.location > self.fractionalNumber+1) {
                    return NO;
                }
            }
            
            // 使用延迟事件会在切换TF的时候 出现异常
            dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [textField formatMoneyUnit:self.textGapUnit];
                });
            });
            break;
        }
        case TextField_pInputType_Bank:{
            cs = [[NSCharacterSet characterSetWithCharactersInString:PicPhoneNumbers] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest){
                return NO;
            }
            // 使用延迟事件会在切换TF的时候 出现异常
            dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [textField formatBankUnit:self.textGapUnit];
                });
            });
            break;
        }
        case TextField_pInputType_Idcard: {
            cs = [[NSCharacterSet characterSetWithCharactersInString:PicIdcardNumbers] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest){
                return NO;
            }
            
            // 使用延迟事件会在切换TF的时候 出现异常
            dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (self.text.length == 17 && string.length>0) {
                        if ([[self.text chinaIdcardLastCode] isEqualToString:@"X"]) {
                            self.text = [NSString stringWithFormat:@"%@X", self.text];
                        }
                    }
                    [textField formatChinaIdcardGapWidth:self.textGapUnit];
                });
            });
            break;
        }
        default:
            break;
    }
    
    if (self.maxLength > 0) {
        if ([textField.text stringByReplacingCharactersInRange:range withString:string].length>self.maxLength) {
            return NO;
        }
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.025 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.editTFBlock) {
            self.editTFBlock(self, textField.text);
        }
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.maxBlock) {
            self.maxBlock(self, self.maxLength);
        }
    });
    
    return YES;
}

// 最大输入数字限制
- (void)setMaxLength:(int)maxLength maxBlock:(TextField_pInput_BlockInt)maxBlock {
    self.maxLength = maxLength;
    self.maxBlock  = maxBlock;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.editTFBlock) {
        self.editTFBlock(self, textField.text);
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (self.clearTFBlock) {
        self.clearTFBlock(self);
    }
    return YES;
}


@end
