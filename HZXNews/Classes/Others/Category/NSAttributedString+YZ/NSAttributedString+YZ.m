//
//  NSAttributedString+YZ.m
//  ez
//
//  Created by apple on 14-8-20.
//  Copyright (c) 2014年 9ge. All rights reserved.
//

#import "NSAttributedString+YZ.h"

@implementation NSAttributedString (YZ)


- (CGSize)sizeWithMaxSize:(CGSize)maxSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
}
@end
