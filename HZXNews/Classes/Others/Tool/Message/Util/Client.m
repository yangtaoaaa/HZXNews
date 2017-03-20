//
//  Client.m
//  爱肚肚
//
//  Created by Yool on 13-7-27.
//  Copyright (c) 2013年 Yool. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "Client.h"
//#import "CommonCache.h"
//#import "CheckDataCache.h"


@implementation Client



static NSInteger currentTopicid;//当前类型
static NSInteger cacheid;//当前类型
static NSInteger currentNavIndex;
static BOOL msgkeyshow;//当前键盘是否打开

+(BOOL) sendMsgKeyShow
{
    return msgkeyshow;
}

+ (void) setsendMsgKeyShow:(BOOL)sendmsgKeyShow
{
    
    if(msgkeyshow!=sendmsgKeyShow)
    {
        msgkeyshow=sendmsgKeyShow;
    }
}

+(NSInteger) Cacheid
{
    return cacheid;
}


+ (void) setCacheid:(NSInteger)newpid
{
    if(cacheid!=newpid)
    {
        cacheid=newpid;
    }
}

+(NSInteger) CurrentNavIndex
{
    return currentNavIndex;
}

+ (void) setCurrentNavIndex:(NSInteger)newnavIndex
{
    if(currentNavIndex!=newnavIndex)
    {
        currentNavIndex=newnavIndex;
    }
}


//@synthesize ProductCache=_ProductCache;

+(NSInteger) CurrentTopicid
{
    return currentTopicid;
}


+ (void) setCurrentTopicid:(NSInteger)newpid
{
    if(currentTopicid!=newpid)
    {
        currentTopicid=newpid;
    }
}

//+(CommonCache *) ProtectDataCaches
//{
//    return protectcommonCaches;
//}
//
//+ (void) setprotectcommonCaches:(CommonCache *)newprotectcommonCaches
//{
//    if(protectcommonCaches!=newprotectcommonCaches)
//    {
//        protectcommonCaches=newprotectcommonCaches;
//    }
//
//    
//}
//
//+(CommonCache *) HistoryCaches
//{
//    return historyCaches;
//}
//
//+ (void) setHistoryCaches:(CommonCache *)newhistoryCaches
//{
//    if(historyCaches!=newhistoryCaches)
//    {
//        historyCaches=newhistoryCaches;
//    }
//    
//    
//}
//
//+(CheckDataCache *) CheckDataCaches
//{
//    return checkCaches;
//}
//
//+ (void) setCheckDataCaches:(CheckDataCache *)newcheckDataCaches
//{
//    if(checkCaches!=newcheckDataCaches)
//    {
//        checkCaches=newcheckDataCaches;
//    }
//    
//    
//}
//
//
//+(CheckDataCache *) SurveyDataCaches
//{
//    return surveyDataCache;
//}
//
//+ (void) setSurveyDataCaches:(CheckDataCache *)newsurveyDataCaches
//{
//    if(surveyDataCache!=newsurveyDataCaches)
//    {
//        surveyDataCache=newsurveyDataCaches;
//    }
//    
//    
//}
//
//
//+(CheckDataCache *) DangerousDataCaches
//{
//     return dagerousDataCache;
//    
//}
//+ (void) setDangersoursDataCaches:(CheckDataCache *)newDangerourDataCaches
//{
//    if(dagerousDataCache!=newDangerourDataCaches)
//    {
//        dagerousDataCache=newDangerourDataCaches;
//    }
//}
//
//+(CommonCache *) CommonCaches
//{
//    return commonCaches;
//}
//+ (void) setcommonCachess:(CommonCache *)newcommonCaches
//{
//    if (commonCaches != newcommonCaches)
//    {
//        commonCaches = newcommonCaches;
//    }
//    
//    
//}

// 是否是今天
+(BOOL)isToDay:(NSDate*)date1
{
    NSDate *nowdate2=[Client localeDate];
    return [Client isSameDay:date1 date2:nowdate2];
}

//s是否同一天
+(BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2
{
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    
    
    return [comp1 day]   == [comp2 day] &&
    
    [comp1 month] == [comp2 month] &&
    
    [comp1 year]  == [comp2 year];
    
}





+ (BOOL)deleteUserInfo
{
    //删除用户的所有信息
//    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"token"];
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"personinfo"];
    
    [[NSUserDefaults standardUserDefaults]setObject:nil  forKey:@"email"];
    [[NSUserDefaults standardUserDefaults]synchronize];
   
    return YES;
}
//
//获取用户名
+ (NSString *)getUserName
{
    NSString *userName = [[NSUserDefaults standardUserDefaults]stringForKey:@"userName"];
    if (!userName) {
        return nil;
    }
    return userName;
}

//返回人员信息字典
+ (NSDictionary *)getPersonInfo
{
    NSDictionary *dicperson = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"personinfo"];
    if (!dicperson) {
        return nil;
    }
    return dicperson;
}

+ (NSString *)getuserId
{
    NSString *userId = [[NSUserDefaults standardUserDefaults]stringForKey:@"userId"];
    if (!userId) {
        return nil;
    }
       return userId;
}

+ (NSString *)getTokenid
{
    NSString *tokenid = [[NSUserDefaults standardUserDefaults]stringForKey:@"tokenid"];
    if (!tokenid) {
        return nil;
    }
    return tokenid;
}

+ (NSString *)getRealName
{
    return @"";
}

//获取数据库颁布
+ (NSString *)getDBversion
{
    NSString *DBversion = [[NSUserDefaults standardUserDefaults]stringForKey:@"DBversion"];
    if (!DBversion) {
        return nil;
    }
    return DBversion;
}




+ (NSString *)getApplastversion
{
    NSString *Applastversion = [[NSUserDefaults standardUserDefaults]stringForKey:@"Applastversion"];
    if (!Applastversion) {
        return nil;
    }
    return Applastversion;
}

+ (void)setApplastversion:(NSString *)newApplastversion
{
     [[NSUserDefaults standardUserDefaults]setObject:newApplastversion forKey:@"newApplastversion"];
}
//
//保存用户信息
+ (void)saveUserWith:(NSString *)userId andUserName:(NSString *)userName andEmail:(NSString *)email
{
    [[NSUserDefaults standardUserDefaults]setObject:userId forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults]setObject:userName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]setObject:email forKey:@"email"];
    [[NSUserDefaults standardUserDefaults]synchronize];//数据同步到文件里，防止丢失
}


//保存用户信息
+ (void)saveUserWith:(NSString *)userId andUserName:(NSString *)userName andEmail:(NSString *)email andTokenid:(NSString *)tokenId
{
    [[NSUserDefaults standardUserDefaults]setObject:userId forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults]setObject:userName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]setObject:email forKey:@"email"];
     [[NSUserDefaults standardUserDefaults]setObject:tokenId forKey:@"tokenid"];
    [[NSUserDefaults standardUserDefaults]synchronize];//数据同步到文件里，防止丢失
}

+ (void)saveUserWith:(NSString *)userId andUserName:(NSString *)userName andTokenid:(NSString *)tokenId andPersonInfo:(NSDictionary *)personinfo
{
    [[NSUserDefaults standardUserDefaults]setObject:userId forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults]setObject:userName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]setObject:personinfo forKey:@"personinfo"];
    [[NSUserDefaults standardUserDefaults]setObject:tokenId forKey:@"tokenid"];
    [[NSUserDefaults standardUserDefaults]synchronize];//数据同步到文件里，防止丢失
}



+ (NSString *)getDeviceId
{
    return [self Systemuuid];
}

+(BOOL)isPureInt:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

//验证为空
+(BOOL)isEmpty:(NSString *)string {
    
    if (!string) {
        return true;
    }
    else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [string stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

//获取本地时间
+(NSDate *)localeDate
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *_localDate = [date  dateByAddingTimeInterval: interval];
    NSLog(@"当前时间 _localDate = %@",_localDate);
    
    return _localDate;
}

//获取本地时间生成唯一文件名
+ (NSString *)pathForTemporaryFileWithPrefix:(NSString *)prefix
{
    NSString *  result;
    CFUUIDRef   uuid;
    CFStringRef uuidStr;
    
    uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    
    uuidStr = CFUUIDCreateString(NULL, uuid);
    assert(uuidStr != NULL);
    
    result = [NSTemporaryDirectory()stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-%@", prefix, uuidStr]];
    assert(result != nil);
    
    CFRelease(uuidStr);
    CFRelease(uuid);
    NSLog(@"result=%@",result);
    return result;
}

+ (NSString *)Systemuuid
{
    NSString *  result;
    CFUUIDRef   uuid;
    CFStringRef uuidStr;
    
    uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    
    uuidStr = CFUUIDCreateString(NULL, uuid);
    assert(uuidStr != NULL);
    
    result = [NSString stringWithFormat:@"%@", uuidStr];//[NSTemporaryDirectory()stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-%@", prefix, uuidStr]];
//    assert(result != nil);
    
    CFRelease(uuidStr);
    CFRelease(uuid);
    NSLog(@"result=%@",result);
    return result;

}


+(int)HoursIntervalSinceDate:(NSDate *)begindate
{
    // NSDate *date1=[dateFormatter dateFromString:@"2010-3-3 11:00"];
    //NSDate *date2=[dateFormatter dateFromString:@"2010-3-4 12:00"];
    //NSTimeInterval time=[date2 timeIntervalSinceDate:date1];
    
    //begindate 比较小的时间
    NSDate *enddate=[Client localeDate];
    NSTimeInterval time=[enddate timeIntervalSinceDate:begindate];
    //int days=((int)time)/(3600*24);
    //float hours=((int)time)%(3600*24)/3600;
    float hours=((int)time)/3600;
    return (int)hours;
    //NSString *dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
}


+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    //NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
    
}

+(NSString *)currentTime
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    NSDate *date = [NSDate date];
    fmt.dateFormat = @"HH:mm"; // @"yyyy-MM-dd HH:mm:ss"
    NSString *time = [fmt stringFromDate:date];
    return time;
}

+(NSString *)currentDay
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    NSDate *date = [NSDate date];
    fmt.dateFormat = @"yyyy-MM-dd"; // @"yyyy-MM-dd HH:mm:ss"
    NSString *day = [fmt stringFromDate:date];
    return day;
}

+ (NSArray *)getAddressCache:(NSString *)userid;
{
    NSString *PK=[NSString stringWithFormat:@"%@_AddressBook_User",[Client getuserId]];
    
    NSArray *CacheArray = [[NSUserDefaults standardUserDefaults]arrayForKey:PK];
   if (!CacheArray)
   {
       return nil;
   }
    return CacheArray;
}

+ (void)saveAddressUserWith:(NSString *)userId andAddressInfo:(NSArray *)arrayInfo
{
    NSString *PK=[NSString stringWithFormat:@"%@_AddressBook_User",userId];
    [[NSUserDefaults standardUserDefaults]setObject:arrayInfo forKey:PK];
    [[NSUserDefaults standardUserDefaults]synchronize];//数据同步到文件里，防止丢失
}
//
////原生URL地址(请求数据时的会员登录凭证)
//- (NSURL *)UrlForRequestWith:(NSString *)urlStr
//{
////    NSString *token = [[NSUserDefaults standardUserDefaults]stringForKey:@"token"];
//    NSString *userId = [[NSUserDefaults standardUserDefaults]stringForKey:@"userId"];
//    BOOL isMember = [[NSUserDefaults standardUserDefaults]boolForKey:@"isMember"];
//    
//    NSString *urlPath = [NSString stringWithFormat:@"%@&loginUserId=%@&checkStr=%@&isMember=%d",
//                         urlStr,
//                         userId,
//                         isMember
//                         ];
//    DLog(@"url is %@",urlPath);
//    return [NSURL URLWithString:urlPath];
//}

@end
