//
//  UIView+LayerEffect.m
//
//  Created by Gxq on 14-6-26.
//  Copyright (c) 2014年 jf. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "UIView+SZ.h"


@implementation UIView (SZ)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}





- (void) setCornerRadius : (CGFloat) radius {
	self.layer.cornerRadius = radius;
}

- (void) setBorder : (UIColor *) color width : (CGFloat) width  {
	self.layer.borderColor = [color CGColor];
	self.layer.borderWidth = width;
}

- (void) setShadow : (UIColor *)color opacity:(CGFloat)opacity offset:(CGSize)offset blurRadius:(CGFloat)blurRadius {
	CALayer *l = self.layer;
	l.shadowColor = [color CGColor];
	l.shadowOpacity = opacity;
	l.shadowOffset = offset;
	l.shadowRadius = blurRadius;
}



@end
