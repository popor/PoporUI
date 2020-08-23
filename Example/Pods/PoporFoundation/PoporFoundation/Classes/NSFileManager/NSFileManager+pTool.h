//
//  NSFileManager+pTool.h
//  PoporFoundation
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (pTool)

#pragma mark - 判断文件是否存在
+ (BOOL)isFileExist:(NSString * _Nullable)filePath;

#pragma mark - 文件长度
+ (NSInteger)fileLength:(NSString * _Nullable)filePath;

#pragma mark - 删除文件
+ (void)deleteFile:(NSString * _Nullable)filePath;

#pragma mark - 创建完整的路径
+ (void)createWithBasePath:(NSString * _Nullable)basePath folder:(NSString * _Nullable)folder;
+ (void)createCachesFolder:(NSString * _Nullable)folderName;

#pragma mark - 移动文件
+ (void)moveFile:(NSString * _Nullable)originPath to:(NSString * _Nullable)targetPath;

#pragma mark - 复制地址
+ (void)copyFile:(NSString * _Nullable)originPath to:(NSString * _Nullable)targetPath;

#pragma mark - 文件路径
+ (NSString *)getFilePath:(NSString * _Nullable)originPath;

#pragma mark - 文件名称
+ (NSString *)getFileName:(NSString * _Nullable)originPath;

@end

NS_ASSUME_NONNULL_END
