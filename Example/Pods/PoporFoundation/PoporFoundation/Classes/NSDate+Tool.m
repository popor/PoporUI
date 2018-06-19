//
//  NSDate+Tool.m
//  Wanzi
//
//  Created by popor on 2017/1/3.
//  Copyright © 2017年 popor. All rights reserved.
//

#import "NSDate+Tool.h"

#define GCCalendar          [GCObject shareGC].gregorianCalendar

//myFormatterString=@"yyyy-MM-dd HH:mm:ss.SSS";
//myFormatterString=@"M/d/yyyy h:m a";
#define DateFormatterString @"yyyy-MM-dd HH:mm:ss"

// ---- 原因https://blog.csdn.net/wxs0124/article/details/50148873
//自定义的打印日志宏 如：
//＃define TWLOGPRINT(xx, …) NSLog(@”%s(%d): ” xx, PRETTY_FUNCTION, LINE, ##VA_ARGS)
//这个宏定义放在了 A.h 中 在B.m文件中使用的时候没有＃import “A.h”
//
//解决办法：
//＃import ”宏定义所在的文件“
#import "NSString+Tool.h"

// 不再采用系统默认日历,比如日本日历或者佛教日历,只是用公历
@interface GCObject : NSObject

@property (nonatomic, strong) NSCalendar * gregorianCalendar;

@end

@implementation GCObject

+ (GCObject *)shareGC
{
    static GCObject * oneGC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneGC = [[self alloc] init];
        // 不再采用系统默认日历,比如日本日历或者佛教日历,只是用公历
        oneGC.gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        //oneGC.gregorianCalendar = [NSCalendar currentCalendar];
    });
    return oneGC;
}


@end

@implementation NSDate (Tool)

#pragma mark - 获取有期限日历
+ (NSDateComponents *)compareDataFrom:(NSDate *)startData to:(NSDate *)endData
{
    if(startData==nil || endData==nil){
        return nil;
    }
    
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
    | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents * intervalDateComponents= [GCCalendar components:unitFlags fromDate:startData toDate:endData options:0];
    return intervalDateComponents;
}

#pragma mark - 获取某个时期日历(NSString)
+ (NSDateComponents *)dateComponentsFromString:(NSString *)InvalidTime
{
    NSDate *InvalidTimeDate = [NSDate dateWithTimeIntervalSince1970:[InvalidTime doubleValue]];
    return [NSDate dateComponentsFromDate:InvalidTimeDate];
}

#pragma mark - 获取某个时期日历(NSDate)
+ (NSDateComponents *)dateComponentsFromDate:(NSDate *)InvalidTimeDate
{
    //NSDate *InvalidTimeDate = [NSDate dateWithTimeIntervalSince1970:[InvalidTime doubleValue]];
    static unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday |NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents * intervalDateComponents= [GCCalendar components:unitFlags fromDate:InvalidTimeDate];
    return intervalDateComponents;
}

#pragma mark - NSString转Date
+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString*)formatterString
{
    NSDateFormatter *dateFormatter = [NSDate defaultDateFormatter:formatterString];
    NSDate * theDateFromString     = [dateFormatter dateFromString:dateString];
    
    return theDateFromString;
}

+ (NSDateFormatter *)defaultDateFormatter:(NSString*)formatterString
{
    if (!formatterString) {
        formatterString = DateFormatterString;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatterString];
    [dateFormatter setCalendar:GCCalendar];
    
    return dateFormatter;
}

#pragma mark - Date转NSString
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString*)formatterString
{
    NSDateFormatter *dateFormatter = [NSDate defaultDateFormatter:formatterString];
    
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString*)formatterString timeZone:(int)timeZone
{
    NSDateFormatter *dateFormatter = [NSDate defaultDateFormatter:formatterString];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:3600* (timeZone)]];
    
    return [dateFormatter stringFromDate:date];
}

#pragma mark - 返回时间戳(NSString)
+ (NSDate *)dateFromUnixDateString:(NSString *)theUnixDateString
{
    return [NSDate dateWithTimeIntervalSince1970:[theUnixDateString doubleValue]];
}

#pragma mark - 返回时间戳(NSTimeInterval)
+ (NSDate *)dateFromUnixDate:(NSTimeInterval)theUnixDate
{
    return [NSDate dateWithTimeIntervalSince1970:theUnixDate];
}

#pragma mark - 获取当前时间戳
+ (NSTimeInterval)getCurrentUnixDate
{
    return [[NSDate date] timeIntervalSince1970];
}

/**
 * 经常返回1480521599.9999971的数据,需要自主四舍五入
 */
#pragma mark - 获取某个时期的时间戳
+ (NSTimeInterval)getUnixDateAt:(NSDate *)anotherDate
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] - [[NSDate date] timeIntervalSinceDate:anotherDate];
    
    return round(time);
}

+ (NSString *)stringFromNow:(NSString *)formatterString
{
    NSDateFormatter *dateFormatter = [NSDate defaultDateFormatter:formatterString];
    
    // 上午下午格式
    //[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString * currentDateString=[dateFormatter stringFromDate:[NSDate date]];
    
    return currentDateString;
}

+ (NSDate *)dateFromNow:(NSString *)formatterString
{
    NSDateFormatter *dateFormatter = [NSDate defaultDateFormatter:formatterString];

    // 上午下午格式
    //[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString * currentDateString=[dateFormatter stringFromDate:[NSDate date]];
    
    return [dateFormatter dateFromString:currentDateString];
}

#pragma mark - 获取时间戳
+ (NSString *)getTimeStamp:(NSDate *)date
{
    return [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
}

#pragma mark - 获取时差
+ (int)getZoneHour
{
    NSTimeZone * zone=[NSTimeZone localTimeZone];
    NSString * secondTime=[NSString stringWithReg:zone.description withREG:@"offset\\s+-?\\d+"];
    secondTime=[NSString stringWithReg:secondTime withREG:@"-?\\d+"];
    NSLog(@"____________description: %@", zone.description);
    NSLog(@"____________secondTime: %@", secondTime);
    NSLog(@"____________zoneTime  : %i", (int)([secondTime integerValue]/3600));
    return (int)([secondTime integerValue]/3600);
}

@end
