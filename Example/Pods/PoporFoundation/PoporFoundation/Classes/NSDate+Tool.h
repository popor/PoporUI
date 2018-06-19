//
//  NSDate+Tool.h
//  Wanzi
//
//  Created by popor on 2017/1/3.
//  Copyright © 2017年 popor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Tool)

/*
 字母  日期或时间元素  表示  示例
 G  Era 标志符  Text  AD
 y  年  Year  1996; 96
 M  年中的月份  Month  July; Jul; 07
 w  年中的周数  Number  27
 W  月份中的周数  Number  2
 D  年中的天数  Number  189
 d  月份中的天数  Number  10
 F  月份中的星期  Number  2
 E  星期中的天数  Text  Tuesday; Tue
 a  Am/pm 标记  Text  PM
 H  一天中的小时数（0-23）  Number  0
 k  一天中的小时数（1-24）  Number  24
 K  am/pm 中的小时数（0-11）  Number  0
 h  am/pm 中的小时数（1-12）  Number  12
 m  小时中的分钟数  Number  30
 s  分钟中的秒数  Number  55
 S  毫秒数  Number  978
 z  时区  General time zone  Pacific Standard Time; PST; GMT-08:00
 Z  时区  RFC 822 time zone  -0800
 //*/

#pragma mark - 获取有期限日历
+ (NSDateComponents *)compareDataFrom:(NSDate *)startData to:(NSDate *)endData;

#pragma mark - 获取某个时期日历(NSString)
+ (NSDateComponents *)dateComponentsFromString:(NSString *)InvalidTime;

#pragma mark - 获取某个时期日历(NSDate)
+ (NSDateComponents *)dateComponentsFromDate:(NSDate *)InvalidTimeDate;

#pragma mark - NSString转Date
+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString*)formatterString;

#pragma mark - Date转NSString
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString*)formatterString;
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString*)formatterString timeZone:(int)timeZone;

#pragma mark - 返回时间(NSString)
+ (NSDate *)dateFromUnixDateString:(NSString *)theUnixDateString;

#pragma mark - 返回时间(NSTimeInterval)
+ (NSDate *)dateFromUnixDate:(NSTimeInterval)theUnixDate;

#pragma mark - 获取当前时间戳
+ (NSTimeInterval)getCurrentUnixDate;

#pragma mark - 获取某个时期的时间戳
+ (NSTimeInterval)getUnixDateAt:(NSDate *)anotherDate;

#pragma mark - 当前指定格式的时间String
+ (NSString *)stringFromNow:(NSString *)formatterString;

#pragma mark - 当前指定格式的时间Date
+ (NSDate *)dateFromNow:(NSString *)formatterString;

#pragma mark - 日期转时间戳
+ (NSString *)getTimeStamp:(NSDate *)date;

#pragma mark - 获取时差
+ (int)getZoneHour;

@end
