//
//  RXGeneSign.h
//  RenXing
//
//  Created by ycmedia_imac on 16/7/12.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXGeneSign : NSObject

// 参数为字典
+ (NSString *)geneSignWithDictionary:(NSDictionary *)dict;

// 参数为字符串，生成sign
+ (NSString *)geneSignWithStr:(NSString *)str;

// mac登录
+ (void)getMacLoginToken:(void (^)(id))success failure:(void (^)(NSError *))failure;

@end
