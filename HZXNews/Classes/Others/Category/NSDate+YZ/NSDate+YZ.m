//
//  NSDate+YZ.m
//  ez
//
//  Created by apple on 14-8-13.
//  Copyright (c) 2014年 9ge. All rights reserved.
//

#import "NSDate+YZ.h"

@implementation NSDate (YZ)

/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}
- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:[NSDate date] toDate:self options:0];
}
- (NSDate *)dateWithYMDH
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}
/**
 *  不是今天
 */
- (NSDateComponents *)daysToToday
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMDH];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMDH];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay | NSCalendarUnitHour fromDate:nowDate  toDate:selfDate options:0];
    return cmps;
}
+ (NSDate *)getDateFromDateString:(NSString *)dateString
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date;
    date = [fmt dateFromString:dateString];
    if(!dateString)
    {
        date = [NSDate date];
    }
    return date;
}
+ (NSString *)getDateStringFromDate:(NSDate *)date
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateString = [fmt stringFromDate:date];
    return dateString;
}
+ (NSString *)getWeekFromDate:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unit = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:unit fromDate:date];
    NSArray *weakDayArray = [[NSArray alloc] initWithObjects:@"",@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSInteger weekDay = components.weekday;
    NSString *weakDayStr = weakDayArray[weekDay];
    return weakDayStr;
}
+ (NSString *)getWeekFromDateString:(NSString *)dateString
{
    NSDate *date = [self getDateFromDateString:dateString];
    
    NSString *weekStr = [self getWeekFromDate:date];
    
    return  weekStr;
}
+ (NSString *)getChineseDateStringFromDateString:(NSString *)dateString
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unit = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    NSDate *date = [fmt dateFromString:dateString];
    NSDateComponents *components = [calendar components:unit fromDate:date];
    NSArray *weakDayArray = [[NSArray alloc] initWithObjects:@"",@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSInteger weekDay = components.weekday;
    NSString *weakDayStr = weakDayArray[weekDay];
    NSString *chineseDateStr = [NSString stringWithFormat:@"%d年%02d月%02d日 %@",components.year,components.month,components.day,weakDayStr];
    return chineseDateStr;
}
+ (BOOL)isequalDayWithDateString:(NSString *)dateString anotherDateString:(NSString *)anotherDateString
{
    NSDate *date = [self getDateFromDateString:dateString];
    NSDate *anotherDate = [self getDateFromDateString:anotherDateString];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unit = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unit fromDate:date];
    NSDateComponents *anotherComponents = [calendar components:unit fromDate:anotherDate];
    return (components.year == anotherComponents.year && components.month == anotherComponents.month && components.day
            == anotherComponents.day);
}
@end
