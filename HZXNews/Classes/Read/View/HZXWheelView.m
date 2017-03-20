//
//  HZXWheelView.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/22.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXWheelView.h"
#import "HZXWheelImageView.h"

@interface HZXWheelView()

@end

@implementation HZXWheelView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        HZXWheelImageView *wheelImageView1 = [[HZXWheelImageView alloc]initWithFrame:CGRectMake(screenWidth/2 - 50, 200, 60, 100)];
        wheelImageView1.image = [UIImage imageNamed:@"timg1"];
        CAKeyframeAnimation *keyframeAnimation1 =  [wheelImageView1 setCurvedPath:M_PI_2 * 2]; // 弧形轨迹
        [self imageAnimation:wheelImageView1 keyframeAnimation:keyframeAnimation1];
        [self addSubview:wheelImageView1];
    }
    return self;
}

- (void)imageAnimation:(UIImageView *)wheelImageView1 keyframeAnimation:(CAKeyframeAnimation *)keyframeAnimation1{
    [UIView animateWithDuration:10 animations:^{
        wheelImageView1.transform = CGAffineTransformRotate(self.transform, M_PI_4); // 转动90°
        [wheelImageView1.layer addAnimation:keyframeAnimation1 forKey:@"image1Path"];
    } completion:^(BOOL finished) {
        
    }];
}


@end
