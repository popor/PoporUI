//
//  NSAssistant.h
//  PoporFoundation
//
//  Created by popor on 2012-3-19.
//

#import <Foundation/Foundation.h>
#import "Os+pPrefix.h"

NS_ASSUME_NONNULL_BEGIN

/**
 该类的所有方法, 均不支持识别 SuperClass, runtime 原生不支持, 否则代码维护非常空难.
 */
@interface NSAssistant : NSObject

/*
 断点调试的时候,推荐使用chisel。或者配合Injection3使用以下方法。
 */
+ (void)NSLogEntity:(id _Nullable)theClassEntity;
+ (void)NSLogEntity:(id _Nullable)theClassEntity title:(NSString * _Nullable)title;

/**
 默认忽略__开头的参数.
 后来一般使用JsonModel来映射model,兼容性更高.
 */
+ (void)setFullEntity:(id _Nullable)theClassEntity withJson:(id _Nullable)theJsonObject;

/**
 以下接口不对参数正确性判断,需要自己审核dic.
 */
+ (void)setVC:(VC_CLASS * _Nullable)vc dic:(id _Nullable)dic;
+ (void)setEntity:(id _Nullable)entity dic:(id _Nullable)dic;

/**
 根据compareValue 得到 这个参数的名称
 */
+ (NSString *)paraNameOf:(id _Nullable)entity equal:(id)compareValue;

@end

NS_ASSUME_NONNULL_END
