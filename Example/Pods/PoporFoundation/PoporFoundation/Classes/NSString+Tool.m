//
//  NSString+Tool.m
//  Wanzi
//
//  Created by popor on 2016/12/28.
//  Copyright © 2016年 popor. All rights reserved.
//

#import "NSString+Tool.h"

// ---- 原因https://blog.csdn.net/wxs0124/article/details/50148873
//自定义的打印日志宏 如：
//＃define TWLOGPRINT(xx, …) NSLog(@”%s(%d): ” xx, PRETTY_FUNCTION, LINE, ##VA_ARGS)
//这个宏定义放在了 A.h 中 在B.m文件中使用的时候没有＃import “A.h”
//
//解决办法：
//＃import ”宏定义所在的文件“
//#import "NSString+Tool.h"
//#import "FunctionPrefix.h"
#import "ColorPrefix.h"

@implementation NSString (Tool)

#pragma mark - 判断空字符串
+ (BOOL)isNullToString:(NSString*)string
{
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]){
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - 正则部分
+ (NSString *)replaceString:(NSString *)theOriginString withREG:(NSString *)theRegString withNewString:(NSString *)theNewString
{
    if (!theOriginString) {
        return @"";
    }
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:theRegString
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSString *newSearchString = [regex stringByReplacingMatchesInString:theOriginString
                                                                options:0
                                                                  range:NSMakeRange(0, [theOriginString length])
                                                           withTemplate:theNewString];
    //NSLog(@"New string: %@",newSearchString);
    return newSearchString;
}

+ (NSString *)cleanString:(NSString *)theOriginString withREG:(NSString *)theRegString
{
    if (!theOriginString) {
        return @"";
    }
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:theRegString
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSString *newSearchString = [regex stringByReplacingMatchesInString:theOriginString
                                                                options:0
                                                                  range:NSMakeRange(0, [theOriginString length])
                                                           withTemplate:@""];
    //NSLog(@"New string: %@",newSearchString);
    return newSearchString;
}

+ (NSString *)stringWithReg:(NSString *)theOriginString withREG:(NSString *)theRegString
{
    if (!theOriginString) {
        return @"";
    }
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:theRegString
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSRange rangeOfFirstMatch = [regex rangeOfFirstMatchInString:theOriginString
                                                         options:0
                                                           range:NSMakeRange(0, [theOriginString length])];
    if (!NSEqualRanges(rangeOfFirstMatch, NSMakeRange(NSNotFound, 0))) {
        
        NSString *substringForFirstMatch = [theOriginString substringWithRange:rangeOfFirstMatch];
        return substringForFirstMatch;
    }
    
    return @"";
}

- (NSString *)replaceWithREG:(NSString *)reg newString:(NSString *)theNewString
{
    if (!self) {
        return @"";
    }
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSString *newSearchString = [regex stringByReplacingMatchesInString:self
                                                                options:0
                                                                  range:NSMakeRange(0, [self length])
                                                           withTemplate:theNewString];
    //NSLog(@"New string: %@",newSearchString);
    return newSearchString;
}

- (NSString *)cleanWithREG:(NSString *)reg
{
    if (!self) {
        return @"";
    }
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSString *newSearchString = [regex stringByReplacingMatchesInString:self
                                                                options:0
                                                                  range:NSMakeRange(0, [self length])
                                                           withTemplate:@""];
    //NSLog(@"New string: %@",newSearchString);
    return newSearchString;
}

- (NSString *)stringWithREG:(NSString *)reg
{
    if (!self) {
        return @"";
    }
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSRange rangeOfFirstMatch = [regex rangeOfFirstMatchInString:self
                                                         options:0
                                                           range:NSMakeRange(0, [self length])];
    if (!NSEqualRanges(rangeOfFirstMatch, NSMakeRange(NSNotFound, 0))) {
        
        NSString *substringForFirstMatch = [self substringWithRange:rangeOfFirstMatch];
        return substringForFirstMatch;
    }
    
    return @"";
}

#pragma mark - 10-16转换
+ (NSString *)stringToHexWithInt:(int)theNumber
{
    return [NSString stringWithFormat:@"%x", (unsigned int) theNumber];
}

+ (NSString *)stringToDecimalWithString:(NSString *)theNumber
{
    return [NSString stringWithFormat:@"%i", (int)strtoul([theNumber UTF8String], 0, 16)];
}

- (UIColor *)toColor
{
    if (self.length == 6) {
        int red   = (int)strtoul([[self substringWithRange:(NSRange){0, 2}] UTF8String], 0, 16);
        int green = (int)strtoul([[self substringWithRange:(NSRange){2, 2}] UTF8String], 0, 16);
        int blue  = (int)strtoul([[self substringWithRange:(NSRange){4, 2}] UTF8String], 0, 16);
        return RGBA(red, green, blue, 1);
    }else{
        return [UIColor clearColor];
    }
}

#pragma mark [获取 一个GUID]
+ (NSString *)getUUID {
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString * uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return uuid;
}

#pragma mark 空格URL
- (NSString *)toUrlEncode {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
}

- (NSString *)toUtf8Encode {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)toHumanizePhoneString {
    if (self.length == 11) {
        return [NSString stringWithFormat:@"%@-%@-%@"
                , [self substringWithRange:(NSRange){0,3}]
                , [self substringWithRange:(NSRange){3,4}]
                , [self substringWithRange:(NSRange){7,4}]
                ];
    }
    return self;
}

- (BOOL)isPhoneNum {
    if (self.length == 11 && [NSString replaceString:self withREG:@"\\d" withNewString:@""].length == 0) {
        return YES;
    }else{
        return NO;
    }
    //    //return YES;
    //    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //    return [regextestmobile evaluateWithObject:self];
}

- (NSData *)toData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}
@end
