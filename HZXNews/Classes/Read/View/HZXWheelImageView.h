//
//  HZXWheelImageView.h
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/22.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZXWheelImageView : UIImageView

/* 创建沿着弧形运动的动画 */
- (CAKeyframeAnimation *)setCurvedPath:(CGFloat)startAngle;

@end
