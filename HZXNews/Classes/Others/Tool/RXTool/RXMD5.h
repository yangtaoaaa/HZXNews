//
//  RXMD5.h
//  RenXing
//
//  Created by ycmedia_imac on 16/7/12.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXMD5 : NSObject

+ (NSString *)CFUUIDStr;
+ (NSString *)md5:(NSString *)str;
+ (NSString *)getUUIDString;
// 对字符串进行url编码
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;
+(NSDictionary *)dictonaryWithJsonString:(NSString *)jsonString;

@end
