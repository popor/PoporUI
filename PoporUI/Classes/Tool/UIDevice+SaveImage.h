//
//  UIDevice+SaveImage.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (SaveImage)

// 保存image
+ (void)saveImageToPhotos:(UIImage *)image showAlert:(BOOL)isShowAlert;
// 保存data
+ (void)saveImageDataToPhotos:(NSData *)imageData showAlert:(BOOL)isShowAlert;

// 保存对应的文件,创建APP名字一致的文件夹
+ (void)saveImage:(UIImage *)image imageUrl:(NSURL *)imageUrl videoUrl:(NSURL *)videoUrl collectionName:(NSString *)collectionName showAlert:(BOOL)isShowAlert;

@end
