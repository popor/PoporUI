//
//  UIImage+save.m
//  Pods-PoporUI_Example
//
//  Created by apple on 2018/11/9.
//

#import "UIImage+save.h"

@implementation UIImage (save)

+ (BOOL)saveImage:(UIImage *)image imagePath:(NSString *)imagePath {
    return [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
}

@end
