//
//  TextField_pInput.h
//  hywj
//
//  Created by popor on 2020/6/28.
//  Copyright © 2020 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TextField_pInput;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(int, TextField_pInputType) {
    TextField_pInputType_NumberInt = 1, // 只限制数字输入,不进行format操作
    TextField_pInputType_NumberFloat,   // 只限制数字输入,不进行format操作
    TextField_pInputType_Password,
    TextField_pInputType_Phone,      // 采用888-8888-8888约束
    TextField_pInputType_MoneyInt,   // 采用100 0000,小数点为分界线
    TextField_pInputType_MoneyFloat, // 采用100 0000.0001,小数点为分界线
    TextField_pInputType_Bank,       // 采用6266 8888 8888 88,第一位为分界线
    TextField_pInputType_Idcard,     // 采用123456 2000 0101 000X格式
};

typedef void(^TextField_pInput_Block)       (TextField_pInput * tf);
typedef BOOL(^TextField_pInput_BlockRBool)  (TextField_pInput * tf); // 需要返回BOOL
typedef void(^TextField_pInput_BlockInt)    (TextField_pInput * tf, int textMaxLength);
typedef void(^TextField_pInput_BlockString) (TextField_pInput * tf, NSString * string);

@interface TextField_pInput : UITextField

@property (nonatomic        ) TextField_pInputType tfType;
@property (nonatomic        ) CGFloat              textGapUnit;      //数字之间的间隔, 默认为6.
@property (nonatomic        ) NSInteger            fractionalNumber; //小数点个数, 默认为2.

@property (nonatomic, copy  ) TextField_pInput_BlockRBool  editTFEnableBlock; // 是否允许编辑TFblock
@property (nonatomic, copy  ) TextField_pInput_BlockString editTFBlock;       // TF编辑实时反馈block
@property (nonatomic, copy  ) TextField_pInput_Block       clearTFBlock;      // TF编辑清除block

- (void)setTfTypeNumberInt;
- (void)setTfTypeNumberFloat;

// 小数点个数
- (void)setTfTypeNumberFloat_fractional:(NSInteger)number;

- (void)setTfTypePhone;
- (void)setTfTypeMoneyFloat;

// 小数点个数
- (void)setTfTypeMoneyFloat_fractional:(NSInteger)number;

- (void)setTfTypeMoneyInt;
- (void)setTfTypePassword;
- (void)setTfTypeBank;

// 省份证格式
- (void)setTfTypeIdcard;

// 最大输入数字限制
- (void)setMaxLength:(int)maxLength maxBlock:(TextField_pInput_BlockInt)maxBlock;

@end

NS_ASSUME_NONNULL_END
