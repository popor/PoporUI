//
//  UIAlertController+pTool.h
//  Masonry
//
//  Created by apple on 2019/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (pTool)

// MARK: 独立的函数
+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelTitle:(nullable NSString *)cancelTitle
  cancelHandel:(void (^ __nullable)(UIAlertAction *action))cancelHandler;

+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelTitle:(nullable NSString *)cancelTitle
  cancelHandel:(void (^ __nullable)(UIAlertAction *action))cancelHandler
    otherTitle:(nullable NSString *)otherTitle
   otherHandel:(void (^ __nullable)(UIAlertAction *action))otherHandler;

+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelAlert:(nullable UIAlertAction *)cancelAlert
    otherAlert:(nullable UIAlertAction *)otherAlert, ... NS_REQUIRES_NIL_TERMINATION;

// MARK: 链式编程
/**
 摘自: https://github.com/wode0weiyi/MethodChaining
 */
- (UIAlertController * (^)( NSString *actionName,void(^)(UIAlertAction *action)))addCancel;

- (UIAlertController * (^)( NSString *actionName,void(^)(UIAlertAction *action)))addDestructive;

- (UIAlertController * (^)( NSString *actionName,void(^)(UIAlertAction *action)))addDefault;

- (UIAlertController * (^)(NSString *placeHolder,void(^)(UITextField *textField)))addInput;

@end

NS_ASSUME_NONNULL_END
