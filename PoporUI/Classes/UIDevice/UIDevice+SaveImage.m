//
//  UIDevice+SaveImage.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//
#import "UIDevice+SaveImage.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "UIDevice+Tool.h"
#import "IToastKeyboard.h"

@implementation UIDevice (SaveImage)

+ (void)saveImageDataToPhotos:(NSData *)imageData showAlert:(BOOL)isShowAlert {
    if (!imageData) {
        AlertToastTitle(@"图片为空");
        return;
    }
    ALAssetsLibrary *assetLib = [[ALAssetsLibrary alloc] init];
    [assetLib writeImageDataToSavedPhotosAlbum:imageData metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
        if (isShowAlert) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (error == nil){
                    AlertToastTitle(@"已存储到本地相册");
                } else {
                    AlertToastTitle(@"存储相片失败");
                }
            });
        }
    }];
}

+ (void)saveImageToPhotos:(UIImage *)image showAlert:(BOOL)isShowAlert {
    if (!image) {
        AlertToastTitle(@"图片为空");
        return;
    }
    if (isShowAlert) {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }else{
        UIImageWriteToSavedPhotosAlbum(image, self, nil, NULL);
    }
}

+ (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (!image) {
        AlertToastTitle(@"图片为空");
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (error == nil){
            AlertToastTitle(@"已存储到本地相册");
        } else {
            AlertToastTitle(@"存储相片失败");
        }
    });
}

+ (void)saveVideoUrl:(NSURL *)videoUrl showAlert:(BOOL)isShowAlert {
    NSString *urlStr = [videoUrl path];
    if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
        //保存视频到相簿，注意也可以使用ALAssetsLibrary来保存
        if (isShowAlert) {
            UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);//保存视频到相簿
        }else{
            UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, nil, nil);//保存视频到相簿
        }
    }
}

//视频保存后的回调
+ (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        AlertToastTitle(@"error.localizedDescription");
    }else{
        AlertToastTitle(@"存储视频成功");
    }
}

+ (void)saveImage:(UIImage *)image imageUrl:(NSURL *)imageUrl videoUrl:(NSURL *)videoUrl collectionName:(NSString *)collectionName showAlert:(BOOL)isShowAlert {
    if (@available(iOS 8, *)) {
        [UIDevice ios8saveImage:image imageUrl:imageUrl videoUrl:videoUrl collectionName:collectionName showAlert:isShowAlert];
    }else{
        if (image) {
            [UIDevice saveImageToPhotos:image showAlert:isShowAlert];
        }else if (imageUrl) {
            [UIDevice saveImageDataToPhotos:[NSData dataWithContentsOfURL:imageUrl] showAlert:isShowAlert];
        }else if (videoUrl) {
            [UIDevice saveVideoUrl:videoUrl showAlert:isShowAlert];;
        }
    }
}

+ (void)ios8saveImage:(UIImage *)image imageUrl:(NSURL *)imageUrl videoUrl:(NSURL *)videoUrl collectionName:(NSString *)collectionName showAlert:(BOOL)isShowAlert {
    if (!image && !imageUrl && !videoUrl) {
        AlertToastTitle(@"保存文件为空");
        return;
    }
    
    if (!collectionName) {
        if (image || imageUrl) {
            collectionName = [NSString stringWithFormat:@"%@(图片)", [UIDevice getAppName]];
        }else if (videoUrl){
            collectionName = [NSString stringWithFormat:@"%@(视频)", [UIDevice getAppName]];
        }
    }
    // 1. 获取相片库对象
    PHPhotoLibrary *library = [PHPhotoLibrary sharedPhotoLibrary];
    // 2. 调用changeBlock
    [library performChanges:^{
        // 2.1 创建一个相册变动请求
        PHAssetCollectionChangeRequest *collectionRequest;
        // 2.2 取出指定名称的相册
        PHAssetCollection *assetCollection = [UIDevice getCurrentPhotoCollectionWithTitle:collectionName];
        // 2.3 判断相册是否存在
        if (assetCollection) { // 如果存在就使用当前的相册创建相册请求
            collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
        } else { // 如果不存在, 就创建一个新的相册请求
            collectionRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:collectionName];
        }
        
        // 2.4 根据传入的相片, 创建相片变动请求
        PHAssetChangeRequest *assetRequest;
        if (image) {
            assetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        }else if (imageUrl) {
            assetRequest = [PHAssetChangeRequest creationRequestForAssetFromImageAtFileURL:imageUrl];
        }else if (videoUrl) {
            assetRequest = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:videoUrl];
        }else{
            // 不肯的情况.
            return;
        }
        // 2.4 创建一个占位对象
        PHObjectPlaceholder *placeholder   = [assetRequest placeholderForCreatedAsset];
        // 2.5 将占位对象添加到相册请求中
        [collectionRequest addAssets:@[placeholder]];
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        // 3. 判断是否出错, 如果报错, 声明保存不成功
        if (isShowAlert) {
            if (error) {
                AlertToastTitle(@"保存失败");
            } else {
                AlertToastTitle(@"保存成功");
            }
        }
    }];
}

+ (PHAssetCollection *)getCurrentPhotoCollectionWithTitle:(NSString *)collectionName {
    // 1. 创建搜索集合
    PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    // 2. 遍历搜索集合并取出对应的相册
    for (PHAssetCollection *assetCollection in result) {
        if ([assetCollection.localizedTitle containsString:collectionName]) {
            return assetCollection;
        }
    }
    return nil;
}

/*
 *  获取相机胶卷相册
 */
//- (void)getCameraRoll
//{
//    // type : PHAssetCollectionTypeSmartAlbum
//    // subtype : PHAssetCollectionSubtypeSmartAlbumUserLibrary
//    PHAssetCollection *cameraRoll = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil].firstObject;
//}


@end
