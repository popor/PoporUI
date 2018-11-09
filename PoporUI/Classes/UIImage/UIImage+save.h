//
//  UIImage+save.h
//  Pods-PoporUI_Example
//
//  Created by apple on 2018/11/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (save)

+ (BOOL)saveImage:(UIImage *)image imagePath:(NSString *)imagePath;

@end

NS_ASSUME_NONNULL_END
