//
//  NSAssistant.h
//  wanzi
//
//  Created by popor on 12-3-19.
//V1.0

#import <UIKit/UIKit.h>

@interface NSAssistant : NSObject

#pragma mark 【数据库方面】
/*
 S:Statement
 只支持全额属性集
 支持的属性包括:int, float, BOOL, NSString, NSMutableString, NSNumber.
 不支持的属性包括:NSArray, NSMutableArray.或者其他自定义类.
 */
+ (void)NSLogEntity:(id)theClassEntity;
+ (void)NSLogEntity:(id)theClassEntity title:(NSString *)title;

/**
 * 默认忽略__开头的参数
 */
+ (void)setFullEntity:(id)theClassEntity withJson:(id)theJsonObject;

+ (void)setVC:(UIViewController *)vc dic:(id)dic;

@end


