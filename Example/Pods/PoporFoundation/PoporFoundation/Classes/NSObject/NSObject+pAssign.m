//
//  NSObject+pAssign.m
//  PoporFoundation
//
//  Created by apple on 2018/12/13.
//  Copyright © 2018 apple. All rights reserved.
//

#import "NSObject+pAssign.h"
#import <objc/runtime.h>

@implementation NSObject (pAssign)

- (void)assignInt:(NSInteger)intValue string:(NSString * _Nullable)string {
    if (!string) {
        string = @"";
    }
    NSObject * entity = self;
    unsigned propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([entity class],&propertyCount);
    for(NSInteger i=0; i<propertyCount; i++){
        NSString * propNameString;
        NSString * propAttributesString;
        
        objc_property_t prop=properties[i];
        
        const char *propName = property_getName(prop);
        propNameString =[NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
        
        const char * propAttributes=property_getAttributes(prop);
        propAttributesString =[NSString stringWithCString:propAttributes encoding:NSASCIIStringEncoding];
        
        //NSLog(@"propNameString: %@, propAttributesString:%@", propNameString, propAttributesString);
        // 根据各个情况处理.
        if ([propAttributesString hasPrefix:@"T@\"NSString\""]){
            [entity setValue:string forKey:propNameString];
        }else if ([propAttributesString hasPrefix:@"T@\"NSMutableString\""]){
            [entity setValue:[[NSMutableString alloc] initWithString:string] forKey:propNameString];
        }
        else if ([propAttributesString hasPrefix:@"Tc"]){ //BOOL
            [entity setValue:[NSNumber numberWithBool:YES] forKey:propNameString];
        }
        else if ([propAttributesString hasPrefix:@"Ti"] ||
                 [propAttributesString hasPrefix:@"TB"]){
            [entity setValue:[NSNumber numberWithInteger:intValue] forKey:propNameString];
        }
        else if ([propAttributesString hasPrefix:@"Tf"]){
            [entity setValue:[NSNumber numberWithInteger:intValue] forKey:propNameString];
        }
        else if ([propAttributesString hasPrefix:@"T@\"NSNumber\""]){
            [entity setValue:[NSNumber numberWithInteger:intValue] forKey:propNameString];
        }
    }
    
    free(properties);
}

// 假如string为空那么设置为 value
- (void)assignNilString:(NSString * _Nullable)strValue {
    if (!strValue) {
        return;
    }
    NSObject * entity = self;
    unsigned propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([entity class],&propertyCount);
    for(NSInteger i=0; i<propertyCount; i++){
        NSString * propNameString;
        NSString * propAttributesString;
        
        objc_property_t prop=properties[i];
        
        const char *propName = property_getName(prop);
        propNameString =[NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
        
        const char * propAttributes=property_getAttributes(prop);
        propAttributesString =[NSString stringWithCString:propAttributes encoding:NSASCIIStringEncoding];
        
        //NSLog(@"propNameString: %@, propAttributesString:%@", propNameString, propAttributesString);
        // 根据各个情况处理.
        if ([propAttributesString hasPrefix:@"T@\"NSString\""]){
            NSString * oldStr = [self valueForKey:propNameString];
            if (oldStr.length == 0) {
                [entity setValue:strValue forKey:propNameString];
            }
        }else if ([propAttributesString hasPrefix:@"T@\"NSMutableString\""]){
            NSString * oldStr = [self valueForKey:propNameString];
            if (oldStr.length == 0) {
                [entity setValue:[[NSMutableString alloc] initWithString:strValue] forKey:propNameString];
            }
        }
    }
    
    free(properties);
}

- (void)assignIncreaseValue  {
    NSInteger index = 0;
    NSObject * entity = self;
    unsigned propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([entity class],&propertyCount);
    for(NSInteger i=0; i<propertyCount; i++){
        index++;
        NSString * propNameString;
        NSString * propAttributesString;
        
        objc_property_t prop=properties[i];
        
        const char *propName = property_getName(prop);
        propNameString =[NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
        
        const char * propAttributes=property_getAttributes(prop);
        propAttributesString =[NSString stringWithCString:propAttributes encoding:NSASCIIStringEncoding];
        
        NSLog(@"propNameString: %@, propAttributesString:%@", propNameString, propAttributesString);
        // 根据各个情况处理.
        if ([propAttributesString hasPrefix:@"T@\"NSString\""]){
            [entity setValue:[NSString stringWithFormat:@"%li", (long)index] forKey:propNameString];
        }else if ([propAttributesString hasPrefix:@"T@\"NSMutableString\""]){
            [entity setValue:[[NSMutableString alloc] initWithFormat:@"%li", (long)index] forKey:propNameString];
        }
        else if ([propAttributesString hasPrefix:@"Tc"]){ //BOOL
            [entity setValue:[NSNumber numberWithBool:YES] forKey:propNameString];
        }
        else if ([propAttributesString hasPrefix:@"Ti"] ||
                 [propAttributesString hasPrefix:@"TB"]){
            [entity setValue:[NSNumber numberWithInteger:index] forKey:propNameString];
        }
        else if ([propAttributesString hasPrefix:@"Tf"]){
            [entity setValue:[NSNumber numberWithInteger:index] forKey:propNameString];
        }
        else if ([propAttributesString hasPrefix:@"T@\"NSNumber\""]){
            [entity setValue:[NSNumber numberWithInteger:index] forKey:propNameString];
        }
    }
    
    free(properties);
}

@end
