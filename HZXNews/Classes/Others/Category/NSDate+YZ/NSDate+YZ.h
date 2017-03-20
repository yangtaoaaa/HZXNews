//
//  NSDate+YZ.h
//  ez
//
//  Created by apple on 14-8-13.
//  Copyright (c) 2014年 9ge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YZ)

/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;
/**
 *  是否为昨天
 */
- (NSDateComponents *)daysToToday;
/**
 *  字符串转时间
 */
+ (NSDate *)getDateFromDateString:(NSString *)dateString;
/**
 *  时间转字符串
 */
+ (NSString *)getDateStringFromDate:(NSDate *)date;
/**
 *  从日期获取星期几
 */
+ (NSString *)getWeekFromDate:(NSDate *)date;
/**
 *  从字符串获取星期几
 */
+ (NSString *)getWeekFromDateString:(NSString *)dateString;
/**
 *  从日期字符串获取格式为：2014年11月21日 星期五
 */
+ (NSString *)getChineseDateStringFromDateString:(NSString *)dateString;
/**
 *  判断两个日期字符串是否是同一天
 */
+ (BOOL)isequalDayWithDateString:(NSString *)dateString anotherDateString:(NSString *)anotherDateString;


@end
