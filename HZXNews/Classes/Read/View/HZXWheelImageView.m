//
//  HZXWheelImageView.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/22.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

// 沿着哪个中心点运动


#import "HZXWheelImageView.h"

#define imageCenterX (screenWidth/2)
#define imageCenterY (screenHeight - 74)

@interface HZXWheelImageView()

@end


@implementation HZXWheelImageView

- (id)initWithFrame:(CGRect)frame startTransform:(CGFloat)startTransform{
    self = [super initWithFrame:frame];
    if(self){
        /* 图片旋转一定的角度 image1*/
        self.transform = CGAffineTransformRotate(self.transform, M_PI_2 * 3); // 270°
    }
    return self;
}

- (CAKeyframeAnimation *)setCurvedPath:(CGFloat)startAngle{
    // 创建沿着弧形运动的动画
    CAKeyframeAnimation *keyframeAnimation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation1.calculationMode = kCAAnimationPaced;
    keyframeAnimation1.fillMode = kCAFillModeForwards;
    keyframeAnimation1.removedOnCompletion = NO;
    keyframeAnimation1.duration = 10;
    keyframeAnimation1.repeatCount = 1;
    // 弧形轨迹 curvedPath1
    CGMutablePathRef curvedPath1 = CGPathCreateMutable();
    CGPathAddArc(curvedPath1, NULL, imageCenterX, imageCenterY, (screenWidth/2 + 50), M_PI_2 * 2, M_PI_2 * 2.5, 0);
    keyframeAnimation1.path = curvedPath1;
    CGPathRelease(curvedPath1);
    return keyframeAnimation1;
}

@end



