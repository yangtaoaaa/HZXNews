//
//  UIColor+YZ.m
//  ez
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 9ge. All rights reserved.
//

#import "UIColor+YZ.h"

@implementation UIColor (YZ)

+ (UIColor *)colorWithHexRGB:(NSString *)hexRGBString
{
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (hexRGBString) {
        NSScanner *scanner = [NSScanner scannerWithString:hexRGBString];
        [scanner scanHexInt:&colorCode];
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    
    return [UIColor colorWithRed:(float)redByte/0xff green:(float)greenByte/0xff blue:(float)blueByte/0xff alpha:1.0];
}

@end
