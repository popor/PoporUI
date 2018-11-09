//
//  UIImage+read.h
//  Pods-PoporUI_Example
//
//  Created by apple on 2018/11/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (read)

+ (NSString *)absoPathInBundleResource:(NSString *)fileName;// 只用下一个就足够了.
+ (UIImage *)imageWithImageName:(NSString *)imageName;
+ (UIImage *)imageWithAbsImageFile:(NSString *)absImageFile;

@end

NS_ASSUME_NONNULL_END
