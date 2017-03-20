//
//  RXUserDefaultTool.h
//  RenXing
//
//  Created by ycmedia_imac on 16/7/12.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXUserDefaultTool : NSObject

//保存键值
+ (void)saveObject:(NSString *)object forKey:(NSString *)key;

//取出值
+ (NSString *)getObjectForKey:(NSString *)key;

//保存整型
+ (void)saveInt:(int)integer forKey:(NSString *)key;

//取出整型
+ (NSInteger)getIntForKey:(NSString *)key;

//移除键值
+ (void)removeObjectForKey:(NSString *)key;


@end
