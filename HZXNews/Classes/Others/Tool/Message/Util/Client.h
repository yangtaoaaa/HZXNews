//
//  Client.h
//  爱肚肚
//
//  Created by Yool on 13-7-27.
//  Copyright (c) 2013年 Yool. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <Foundation/Foundation.h>

@class CommonCache;
@class CheckDataCache;

@interface Client : NSObject


//- (void)showNetworkFailed:(UIView *)view;

//- (id) getJsonDataWith:(ASIHTTPRequest*)request;

//保存用户名，id md5后的内容
//- (BOOL)userLogined;
+(BOOL)deleteUserInfo;
//- (NSURL *)UrlForRequestWith:(NSString *)urlStr;
//- (void)getTmpUserInfo;


+ (NSString *)getUserName;
+ (NSString *)getuserId;
+ (NSString *)getDeviceId;//设备唯一编号
+ (NSString *)getTokenid;//设备访问标示
+ (NSString *)getRealName;

+ (NSString *)getDBversion;

+ (NSDictionary *)getPersonInfo;//获取人员信息

+ (NSArray *)getAddressCache:(NSString *)userid;//获取通讯录用户缓存;


+ (NSString *)getApplastversion;//获取上一次版本
+ (void)setApplastversion:(NSString *)newApplastversion;

+ (void)saveUserWith:(NSString *)userId andUserName:(NSString *)userName andEmail:(NSString *)email;

+ (void)saveUserWith:(NSString *)userId andUserName:(NSString *)userName andEmail:(NSString *)email andTokenid:(NSString *)tokenId;

+ (void)saveUserWith:(NSString *)userId andUserName:(NSString *)userName andTokenid:(NSString *)tokenId andPersonInfo:(NSDictionary *)personinfo;

+ (void)saveAddressUserWith:(NSString *)userId andAddressInfo:(NSArray *)arrayInfo;
/* ****  校验函数 @begin  **** */

+(BOOL)isPureInt:(NSString *)string;//是否数字
+(BOOL)isEmpty:(NSString *)string;//是否为空

/* ****  校验函数 @end  **** */


/* ****  日期时间相关函数 @begin  **** */

+(BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2;//比较两个日期是否是同一天
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;//比较两个日期大小
+(BOOL)isToDay:(NSDate*)date1;//是否是当天记录

+(NSDate *)localeDate;//获取当前本地日期和时间
+(NSString *)currentTime;//当前时间
+(NSString *)currentDay;//当前日期

+(int)HoursIntervalSinceDate:(NSDate *)begindate;//计算两个时间之间的间隔

/* ****  日期时间相关函数 @end  **** */



+(NSInteger) Cacheid;

+ (void) setCacheid:(NSInteger)newpid;

+(NSInteger) CurrentTopicid;

+ (void) setCurrentTopicid:(NSInteger)newpid;

+ (NSString *)Systemuuid;
+ (NSString *)pathForTemporaryFileWithPrefix:(NSString *)prefix;

+(NSInteger) CurrentNavIndex;//当前index;
+ (void) setCurrentNavIndex:(NSInteger)newnavIndex;

//监听键盘打开事件
+(BOOL) sendMsgKeyShow;

+ (void) setsendMsgKeyShow:(BOOL)sendmsgKeyShow;
@end
