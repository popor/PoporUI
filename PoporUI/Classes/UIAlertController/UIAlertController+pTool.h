//
//  UIAlertController+pTool.h
//  Masonry
//
//  Created by apple on 2019/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (pTool)

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

@end

NS_ASSUME_NONNULL_END
