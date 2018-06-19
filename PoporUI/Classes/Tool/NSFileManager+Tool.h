//
//  NSFileManager+Tool.h
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Tool)

#pragma mark - 判断文件是否存在
+ (BOOL)isFileExist:(NSString *)filePath;

#pragma mark - 文件长度
+ (int)fileLength:(NSString *)filePath;

#pragma mark - 删除文件
+ (void)deleteFile:(NSString *)filePath;

#pragma mark - 创建完整的路径
+ (void)createWithBasePath:(NSString *)basePath folder:(NSString *)folder;
+ (void)createCachesFolder:(NSString *)folderName;

#pragma mark - 移动文件
+ (void)moveFile:(NSString *)originPath to:(NSString *)targetPath;

#pragma mark - 复制地址
+ (void)copyFile:(NSString *)originPath to:(NSString *)targetPath;

#pragma mark - 文件路径
+ (NSString *)getFilePath:(NSString *)originPath;

#pragma mark - 文件名称
+ (NSString *)getFileName:(NSString *)originPath;


@end
