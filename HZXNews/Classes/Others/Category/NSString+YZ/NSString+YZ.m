//
//  NSString+YZ.m
//  ez
//
//  Created by apple on 14-11-3.
//  Copyright (c) 2014年 9ge. All rights reserved.
//


#define screenWidth   ([UIScreen mainScreen].bounds.size.width)
#define screenHeight  ([UIScreen mainScreen].bounds.size.height)


#import "NSString+YZ.h"

@implementation NSString (YZ)
- (NSString *)URLEncodedString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)self,
                                                                           NULL,
                                                                           CFSTR("!*'();:@&=+$,%#[]/"),
                                                                           kCFStringEncodingUTF8));
    return result;
}
- (NSString*)URLDecodedString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                           (CFStringRef)self,
                                                                                           CFSTR(""),
                                                                                           kCFStringEncodingUTF8));
    return result;
}
- (NSMutableAttributedString *)attributedString:(NSDictionary *)attrs WithRange:(NSRange)range
{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    if(range.location < self.length)
    {
        [attStr addAttributes:attrs range:range];
    }
    return attStr;
}
- (NSMutableAttributedString *)attributedStringWithAttributs:(NSDictionary *)attrs firstString:(NSString *)firstString secondString:(NSString *)secondString
{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range1 = [self rangeOfString:firstString];
    NSRange range2 = [self rangeOfString:secondString];
    [attStr addAttributes:attrs range:NSMakeRange(range1.location + 1, range2.location - range1.location - 1)];
    return attStr;
}
- (NSUInteger)numbersOfCharacters
{
    NSUInteger len = self.length;
    // 汉字字符集
    NSString * pattern  = @"[\u4e00-\u9fa5]";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    // 计算中文字符的个数
    NSInteger numMatch = [regex numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, len)];
    
    return len + numMatch;
}
- (NSString *)stringByReversed
{
    NSMutableString *s = [NSMutableString string];
    for (NSUInteger i=self.length; i>0; i--) {
        [s appendString:[self substringWithRange:NSMakeRange(i-1, 1)]];
    }
    
    return s;
}
- (CGSize)sizeWithLabelFont:(UIFont *)font
{
    return [self sizeWithFont:font maxSize:CGSizeMake(screenWidth, screenHeight)];
}
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    CGSize size = CGSizeZero;
    if(iOS7)
    {
        size = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    }else
    {
        size = [self sizeWithFont:font constrainedToSize:maxSize];
    }
    return size;
}
@end
