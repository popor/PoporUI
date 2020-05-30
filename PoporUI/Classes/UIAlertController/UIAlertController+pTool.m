//
//  UIAlertController+pTool.m
//  Masonry
//
//  Created by apple on 2019/9/16.
//

#import "UIAlertController+pTool.h"

@implementation UIAlertController (pTool)

// MARK: 独立的函数
+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelTitle:(nullable NSString *)cancelTitle
  cancelHandel:(void (^ __nullable)(UIAlertAction *action))cancelHandler {
    
    [self showAt:vc style:style title:title message:message cancelTitle:cancelTitle cancelHandel:cancelHandler otherTitle:nil otherHandel:nil];
}

+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelTitle:(nullable NSString *)cancelTitle
  cancelHandel:(void (^ __nullable)(UIAlertAction *action))cancelHandler
    otherTitle:(nullable NSString *)otherTitle
   otherHandel:(void (^ __nullable)(UIAlertAction *action))otherHandler {
    
    UIAlertController * oneAC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancelHandler];
    [oneAC addAction:cancleAction];
    
    if (otherTitle) {
        UIAlertAction * otherAction  = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:otherHandler];
        
        [oneAC addAction:otherAction];
    }
    [vc presentViewController:oneAC animated:YES completion:nil];
}

+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelAlert:(nullable UIAlertAction *)cancelAlert
    otherAlert:(nullable UIAlertAction *)otherAlert, ... NS_REQUIRES_NIL_TERMINATION {
    
    UIAlertController * oneAC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    if (cancelAlert) {
        [oneAC addAction:cancelAlert];
    }
    
    va_list argList;
    if (otherAlert) {
        [oneAC addAction:otherAlert];
        
        va_start(argList, otherAlert);
     
        UIAlertAction * temp;
        // VA_ARG宏，获取可变参数的当前参数，返回指定类型并将指针指向下一参数
        // 首先 argList的内存地址指向的fristObj将对应储存的值取出,如果不为nil则判断为真,将取出的值房在数组中,
        //并且将指针指向下一个参数,这样每次循环argList所代表的指针偏移量就不断下移直到取出nil
        while ((temp = va_arg(argList, id))) {
            if (otherAlert) {
                [oneAC addAction:otherAlert];
            }
        }
    }
    
    // 清空列表
    va_end(argList);
    
    [vc presentViewController:oneAC animated:YES completion:nil];
}

// MARK: 链式编程
- (UIAlertController * (^)( NSString *actionName,void(^)(UIAlertAction *action)))addCancel {
    UIAlertController *(^addActionBlock)(NSString * actionName,void(^)(UIAlertAction *action)) = ^(NSString * actionName,void(^neibublock)(UIAlertAction *action)){
        UIAlertAction * action = [UIAlertAction actionWithTitle:actionName style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            if (neibublock) {
                neibublock(action);
            }
        }];
        [self addAction:action];
        return self;
    };
    return addActionBlock;
}

- (UIAlertController * (^)( NSString *actionName,void(^)(UIAlertAction *action)))addDestructive {
    UIAlertController *(^addActionBlock)(NSString * actionName,void(^)(UIAlertAction *action)) = ^(NSString * actionName,void(^neibublock)(UIAlertAction *action)){
        UIAlertAction * action = [UIAlertAction actionWithTitle:actionName style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
            if (neibublock) {
                neibublock(action);
            }
        }];
        [self addAction:action];
        return self;
    };
    return addActionBlock;
}

- (UIAlertController * (^)( NSString *actionName,void(^)(UIAlertAction *action)))addDefault {
    UIAlertController *(^addActionBlock)(NSString * actionName,void(^)(UIAlertAction *action)) = ^(NSString * actionName,void(^neibublock)(UIAlertAction *action)){
        UIAlertAction * action = [UIAlertAction actionWithTitle:actionName style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            if (neibublock) {
                neibublock(action);
            }
        }];
        [self addAction:action];
        return self;
    };
    return addActionBlock;
}

- (UIAlertController * (^)(NSString *placeHolder, void (^)(UITextField *)))addInput {
    UIAlertController * (^inputBlock)(NSString *placeHolder,void (^)(UITextField *textField)) = ^(NSString * placeHolder,void(^neibublock)(UITextField * textField)){
        [self addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = placeHolder;
            if (neibublock) {
                neibublock(textField);
            }
        }];
        return self;
    };
    return inputBlock;
}


@end
