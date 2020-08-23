//
//  NSFileManager+pTool.m
//  PoporFoundation
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "NSFileManager+pTool.h"

@implementation NSFileManager (pTool)

#pragma mark - 判断文件是否存在
+ (BOOL)isFileExist:(NSString * _Nullable)filePath
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        // 如果存在的话，直接返回就好了。
        return YES;
    }else {
        return NO;
    }
    // end.
}

#pragma mark - 文件长度
+ (NSInteger)fileLength:(NSString * _Nullable)filePath
{
    return [NSData dataWithContentsOfFile:filePath].length;
}

#pragma mark - 删除文件
+ (void)deleteFile:(NSString * _Nullable)filePath
{
    if (!filePath) {
        return;
    }else{
        filePath = [filePath stringByRemovingPercentEncoding];
    }
    if([NSFileManager isFileExist:filePath]){
        NSError *error;
        if ([[NSFileManager defaultManager] removeItemAtPath:filePath error:&error] != YES){
            NSLog(@"Unable to delete file: %@", [error localizedDescription]);
        }
        // end.
    }
}

#pragma mark - 创建完整的路径
+ (void)createWithBasePath:(NSString * _Nullable)basePath folder:(NSString * _Nullable)folder
{
    // basePath 是指最基本的路径例如：/Users/admin/Library/Application Support/iPhone
    // Simulator/4.2/Applications/BB05C254-2E01-4679-B2C8-539B1FD04F92/Library/Caches
    
    // originPath 是指mainConfig.db或者其他等。
    
    NSRange firstRange = [folder rangeOfString:@"/"];
    if (firstRange.location>0 &&firstRange.length>0)
    {
        firstRange.location=firstRange.location+firstRange.length;
        firstRange.length=[folder length]-firstRange.location;
        NSRange secondRange= [folder rangeOfString:@"/"
                                           options:NSCaseInsensitiveSearch
                                             range:firstRange];
        while (secondRange.location>0 && secondRange.length>0)
        {
            firstRange=secondRange;
            firstRange.location=firstRange.location+firstRange.length;
            firstRange.length=[folder length]-firstRange.location;
            secondRange=[folder rangeOfString:@"/"
                                      options:NSCaseInsensitiveSearch
                                        range:firstRange];
        }
        secondRange.location=0;
        secondRange.length=firstRange.location;
        NSMutableString * willCreatPath= [[NSMutableString alloc]init];
        [willCreatPath setString:[folder substringWithRange:secondRange]];
        //NSLog(@"willCreatPath -- %@",willCreatPath);
        [[NSFileManager defaultManager] createDirectoryAtPath:[NSString stringWithFormat:@"%@/%@"
                                                               ,basePath
                                                               ,willCreatPath]
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
        //[willCreatPath release];
    }else {
        [[NSFileManager defaultManager] createDirectoryAtPath:[NSString stringWithFormat:@"%@/%@"
                                                               ,basePath
                                                               ,folder]
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
        return;
    }
    // end.
}

+ (void)createCachesFolder:(NSString * _Nullable)folderName
{
    /* 路径 */
    NSArray  * pathsToDocuments = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSMutableString * cachPath = [[NSMutableString alloc] initWithString:[pathsToDocuments objectAtIndex:0]];
    [cachPath setString:[cachPath stringByReplacingOccurrencesOfString:@"/Documents" withString:@"/Library/Caches"]];
    
    [[NSFileManager defaultManager] createDirectoryAtPath:[NSString stringWithFormat:@"%@/%@", cachPath, folderName]
                              withIntermediateDirectories:YES attributes:nil error:nil];
    
    // end.
}

#pragma mark - 移动文件
+ (void)moveFile:(NSString * _Nullable)originPath to:(NSString * _Nullable)targetPath
{
    [[NSFileManager defaultManager] moveItemAtPath:originPath toPath:targetPath error:nil];
}

#pragma mark - 复制地址
+ (void)copyFile:(NSString * _Nullable)originPath to:(NSString * _Nullable)targetPath
{
    [[NSFileManager defaultManager] copyItemAtPath:originPath toPath:targetPath error:nil];
}

#pragma mark - 文件路径
+ (NSString *)getFilePath:(NSString * _Nullable)originPath
{
    if (!originPath) {
        return nil;
    }
    NSMutableString * operateString=[[NSMutableString alloc] initWithString:originPath];
    NSRegularExpression *regex=[[NSRegularExpression alloc]initWithPattern:@"(\\s|\\w|\\.)+$"
                                                                   options:NSRegularExpressionCaseInsensitive
                                                                     error:NULL];
    [regex replaceMatchesInString:operateString options:0 range:NSMakeRange(0,[operateString length])
                     withTemplate:@""];
    NSString * path=[NSString stringWithFormat:@"%@",operateString];
    operateString=nil;
    return  path;
    // end.
}

#pragma mark - 文件名称
+ (NSString *)getFileName:(NSString * _Nullable)originPath
{
    if (!originPath) {
        return nil;
    }
    NSMutableString * operateString=[[NSMutableString alloc] initWithString:originPath];
    NSRegularExpression *regex=[[NSRegularExpression alloc]initWithPattern:@"(\\s|\\w|\\.)+$"
                                                                   options:NSRegularExpressionCaseInsensitive
                                                                     error:NULL];
    [regex replaceMatchesInString:operateString options:0 range:NSMakeRange(0,[operateString length])
                     withTemplate:@""];
    NSString * path=[NSString stringWithFormat:@"%@",operateString];
    [operateString setString:originPath];
    NSString * name=[operateString stringByReplacingOccurrencesOfString:path withString:@""];
    operateString=nil;
    return name;
    // end.
}


@end
