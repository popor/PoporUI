//
//  NSAssistant.m
//  PoporFoundation
//
//  Created by popor on 12-3-19.
//  Copyright 2012 popor. All rights reserved.
//

#import "NSAssistant.h"

#import <objc/runtime.h>

// ---- 原因https://blog.csdn.net/wxs0124/article/details/50148873
//自定义的打印日志宏 如：
//＃define TWLOGPRINT(xx, …) NSLog(@”%s(%d): ” xx, PRETTY_FUNCTION, LINE, ##VA_ARGS)
//这个宏定义放在了 A.h 中 在B.m文件中使用的时候没有＃import “A.h”
//
//解决办法：
//＃import ”宏定义所在的文件“
#import "Fun+pPrefix.h"

@implementation NSAssistant

+ (void)NSLogEntity:(id _Nullable)theClassEntity title:(NSString * _Nullable)title {
    NSLog(@"实体数据-- %@ --------------------------------", title);
    [self NSLogEntity:theClassEntity];
    NSLog(@"---------------------------------------------");
}

+ (void)NSLogEntity:(id _Nullable)theClassEntity {
    if (!PIsDebugVersion) {
        // 正式版不打印任何数据
        return;
    }
    if (!theClassEntity) {
        NSLog(@"空 实体");
        return;
    }
    
    unsigned propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([theClassEntity class],&propertyCount);
    for(NSInteger i=0;i<propertyCount;i++){
        NSString * propNameString;
        NSString * propAttributesString;
        
        objc_property_t prop=properties[i];
        
        const char *propName = property_getName(prop);
        propNameString =[NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
        
        const char * propAttributes=property_getAttributes(prop);
        propAttributesString =[NSString stringWithCString:propAttributes encoding:NSASCIIStringEncoding];
        
        id value = [theClassEntity valueForKey:propNameString];
        if (value) {
            NSLog(@"%@ : %@", propNameString, value);
        }else{
            NSLog(@"%@ : __null__", propNameString);
        }
        //        continue;
        //        NSString * valueString;
        //        // 根据各个情况处理.
        //        if ([propAttributesString hasPrefix:@"T@\"NSString\""]
        //            || [propAttributesString hasPrefix:@"T@\"NSMutableString\""]){
        //            valueString=[NSString stringWithFormat:@"%@",value];
        //        }else if ([propAttributesString hasPrefix:@"Tc"]
        //                  || [propAttributesString hasPrefix:@"Ti"]
        //                  || [propAttributesString hasPrefix:@"TB"]){
        //            valueString=[NSString stringWithFormat:@"%i",[value intValue]];
        //        }else if ([propAttributesString hasPrefix:@"Tf"]){
        //            valueString=[NSString stringWithFormat:@"%f",[value floatValue]];
        //        }else if ([propAttributesString hasPrefix:@"T@\"NSNumber\""]){
        //
        //            NSNumber * oneNumber=(NSNumber *)value;
        //            valueString=[NSString stringWithFormat:@"%i",[oneNumber intValue]];
        //        }else{
        //            NSLog(@"%@ : %@", propNameString, value);
        //        }
        //        if (valueString==nil) {
        //            continue;
        //        }else {
        //            NSLog(@"%@ : %@", propNameString, valueString);
        //        }
    } // end for.
    free(properties);
}

+ (void)setFullEntity:(id _Nullable)theClassEntity withJson:(id _Nullable)theJsonObject
{
    if (!theJsonObject) {
        return;
    }
    if (!theClassEntity) {
        return;
    }
    unsigned propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([theClassEntity class],&propertyCount);
    for(NSInteger i=0;i<propertyCount;i++){
        NSString * propNameString;
        NSString * propAttributesString;
        
        objc_property_t prop = properties[i];
        
        const char *propName = property_getName(prop);
        propNameString =[NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
        if ([propNameString hasPrefix:@"__"]) {
            continue;
        }
        @try {
            [theJsonObject objectForKey:propNameString];
        }@catch (NSException * e) {
            NSLog(@"json 匹配出错.");
            continue;
        }
        
        const char * propAttributes=property_getAttributes(prop);
        propAttributesString =[NSString stringWithCString:propAttributes encoding:NSASCIIStringEncoding];
        id valueString=[theJsonObject objectForKey:propNameString];
        
        // 2017/05/18
        // valueString=nil 的时候 ![valueString isKindOfClass:[NSNull class]]失效.
        BOOL isHasValue = valueString && ![valueString isKindOfClass:[NSNull class]];
        //NSLog(@"name: %@, 属性: %@, has:%i", propNameString, propAttributesString, isHasValue);
        
        // 屏蔽系统参数
        if ([propAttributesString hasPrefix:@"TQ,R"]) {
            // nsobject 的 hash
            continue;
        }
        if ([propAttributesString hasPrefix:@"T#,R"]) {
            // nsobject 的 superclass
            continue;
        }
        if ([propAttributesString hasPrefix:@"T@\"NSString\",R,C"]) {
            // nsobject 的 describe, debugDescription
            continue;
        }
        
        if ([propAttributesString hasPrefix:@"T@\"NSString\""]
            || [propAttributesString hasPrefix:@"T@\"NSMutableString\""])
        {
            if (isHasValue) {
                NSObject * tempObject=[theJsonObject objectForKey:propNameString];
                if ([tempObject isKindOfClass:[NSNumber class]]) {
                    [theClassEntity setValue:[NSString stringWithFormat:@"%lli", (long long)[(NSNumber *)tempObject longLongValue]] forKey:propNameString];
                }else{
                    [theClassEntity setValue:tempObject forKey:propNameString];
                }
            }else{
                [theClassEntity setValue:@"" forKey:propNameString];
            }
            continue;
        }
        if ([propAttributesString hasPrefix:@"T@\"NSNumber\""])
        {
            if (isHasValue) {
                [theClassEntity setValue:[theJsonObject objectForKey:propNameString] forKey:propNameString];
                
            }else{
                [theClassEntity setValue:[NSNumber numberWithInt:0] forKey:propNameString];
                
            }
            continue;
        }
        if ([propAttributesString hasPrefix:@"Tc"]
            || [propAttributesString hasPrefix:@"Ti"]
            || [propAttributesString hasPrefix:@"TB"])
        {
            // bug.
            if (isHasValue) {
                [theClassEntity setValue:[NSNumber numberWithInt:[valueString intValue]] forKey:propNameString];
            }else{
                [theClassEntity setValue:[NSNumber numberWithInt:0] forKey:propNameString];
            }
            continue;
        }
        if ([propAttributesString hasPrefix:@"Tf"])
        {
            if (isHasValue) {
                [theClassEntity setValue:[NSNumber numberWithFloat:[valueString floatValue]] forKey:propNameString];
            }else{
                [theClassEntity setValue:[NSNumber numberWithFloat:0.0f] forKey:propNameString];
            }
            continue;
        }
        if ([propAttributesString hasPrefix:@"Tq,N,V"])
        {
            if (isHasValue) {
                [theClassEntity setValue:[NSNumber numberWithInteger:[valueString integerValue]]forKey:propNameString];
            }else{
                [theClassEntity setValue:[NSNumber numberWithInt:0] forKey:propNameString];
            }
            continue;
        }
        if ([propAttributesString hasPrefix:@"T@\"NSDictionary\""])
        {
            if (isHasValue) {
                [theClassEntity setValue:valueString forKey:propNameString];
            }else{
                [theClassEntity setValue:[[NSDictionary alloc] init] forKey:propNameString];
            }
            continue;
        }
    }
    free(properties);
}

+ (void)setVC:(VC_CLASS * _Nullable)vc dic:(id _Nullable)dic {
    if (!dic || !vc) {
        return;
    }
    vc.title = dic[@"title"];
    [self setEntity:vc dic:dic];
}

+ (void)setEntity:(id _Nullable)entity dic:(id _Nullable)dic {
    if (!dic || !entity) {
        return;
    }
    
    unsigned propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([entity class],&propertyCount);
    for(NSInteger i=0;i<propertyCount;i++){
        NSString * keySName;                              // key string  名字
        NSString * keySAtt;                               // key string  属性
        objc_property_t keyChar = properties[i];          // key Char 属性
        const char *keyCName = property_getName(keyChar); // key Char 名字
        keySName = [NSString stringWithCString:keyCName encoding:NSASCIIStringEncoding];
        
        @try {
            [dic objectForKey:keySName];
        }@catch (NSException * e) {
            NSLog(@"设置VC属性时候,dic取值错误:%@\n\n\n", keySName);
            continue;
        }
        
        const char * keyCAtt = property_getAttributes(keyChar); // key Char 属性
        keySAtt   = [NSString stringWithCString:keyCAtt encoding:NSASCIIStringEncoding];
        id value = [dic objectForKey:keySName];
        //NSLog(@"%s key:%@, value:%@", __func__, keySName, keySAtt);
        
        if (!value) continue;
        
        // 屏蔽系统参数
        // nsobject 的 hash
        if ([keySAtt hasPrefix:@"TQ,R"]) continue;
        // nsobject 的 superclass
        if ([keySAtt hasPrefix:@"T#,R"]) continue;
        // nsobject 的 describe, debugDescription
        if ([keySAtt hasPrefix:@"T@\"NSString\",R,C"]) continue;
        
        if ([keySAtt hasPrefix:@"Tc"]
            || [keySAtt hasPrefix:@"Ti"]
            || [keySAtt hasPrefix:@"TB"]) {
            [entity setValue:[NSNumber numberWithInt:[value intValue]] forKey:keySName];
            continue;
        }
        if ([keySAtt hasPrefix:@"Tf"]) {
            [entity setValue:[NSNumber numberWithFloat:[value floatValue]] forKey:keySName];
            continue;
        }
        // defalut
        [entity setValue:value forKey:keySName];
    }
    free(properties);
    
    //NSLog(@"\n\n");
}

/**
 根据compareValue 得到 这个参数的名称
 */
+ (NSString *)paraNameOf:(id _Nullable)entity equal:(id)compareValue {
    NSString * parameterName;
    
    unsigned propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([entity class],&propertyCount);
    for(int i=0;i<propertyCount;i++){
        NSString * propNameString;
        NSString * propAttributesString;
        
        objc_property_t prop=properties[i];
        
        const char *propName = property_getName(prop);
        propNameString =[NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
        
        const char * propAttributes=property_getAttributes(prop);
        propAttributesString =[NSString stringWithCString:propAttributes encoding:NSASCIIStringEncoding];
        
        id value = [entity valueForKey:propNameString];
        if ([value isEqual:compareValue]) {
            //NSLog(@"NSParameterName %@ : %@", propNameString, value);
            parameterName = propNameString;
            break;
        }
    } // end for.
    free(properties);
    
    return parameterName;
}

@end

