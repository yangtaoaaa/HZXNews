//
//  UIView+LayerEffect.h
//
//  Created by Gxq on 14-6-26.
//  Copyright (c) 2014年 jf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SZ)
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

/**
 *  设置View的圆角边框
 *
 *  @param radius 圆角半径
 */
- (void) setCornerRadius : (CGFloat) radius;


/**
 *  设置View内边框
 *
 *  @param color 颜色
 *  @param width 边框宽度
 */
- (void) setBorder : (UIColor *) color width : (CGFloat) width;




/**
 *  设置阴影
 *
 *  @param color      颜色
 *  @param opacity    透明度
 *  @param offset     阴影偏移量
 *  @param blurRadius 模糊半径
 */
- (void) setShadow : (UIColor *)color opacity:(CGFloat)opacity offset:(CGSize) offset blurRadius:(CGFloat)blurRadius;




@end
