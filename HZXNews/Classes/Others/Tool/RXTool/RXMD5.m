//
//  RXMD5.m
//  RenXing
//
//  Created by ycmedia_imac on 16/7/12.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import "RXMD5.h"
#import "SSKeychain.h"
#import <CommonCrypto/CommonDigest.h>

@implementation RXMD5

// MD5加密
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

///Mac ID
+ (NSString *)getUUIDString
{
    NSString *MacStr = [SSKeychain passwordForService:@"com.ycmedia.RenXing" account:@"com.ycmedia.RenXing"];
    if (MacStr.length>0) {
//        HZXLog(@"MacStr等于%@", MacStr);
        return MacStr;
    }else{
        NSString *uuidStr = [self CFUUIDStr];
        [SSKeychain setPassword:uuidStr forService:@"com.ycmedia.RenXing" account:@"com.ycmedia.RenXing"];
        MacStr = [SSKeychain passwordForService:@"com.ycmedia.RenXing" account:@"com.ycmedia.RenXing"];
//        HZXLog(@"uuidStr等于%@", uuidStr);
        return uuidStr;
    }
}

// 获取UUID的方法
//+ (NSString *)getUUIDString
+ (NSString *)CFUUIDStr{
    CFUUIDRef puuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
    CFRelease(uuidString);
    return result;
}

// 对字符串进行url编码
+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    NSString *outputStr = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)input,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    return outputStr;
}


+ (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

// json格式字符串转成字典

+(NSDictionary *)dictonaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    if(err) {
        
        HZXLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}












@end
