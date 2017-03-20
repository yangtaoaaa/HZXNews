//
//  UIColor+YZ.h
//  ez
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 9ge. All rights reserved.
//  将

#import <UIKit/UIKit.h>

@interface UIColor (YZ)

// 将16进制颜色(html颜色值)字符串转为UIColor
+ (UIColor *)colorWithHexRGB:(NSString *)hexRGBString;

@end
