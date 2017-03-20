//
//  HZXImageWheelViewController.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/21.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

// 沿着哪个中心点运动
#define circleCenterX (screenWidth/2)
#define circleCenterY (screenHeight - 74)

#import "HZXWheelImageViewController.h"
#import "HZXWheelView.h"


@interface HZXWheelImageViewController ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation HZXWheelImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupCircle];
}

- (void)setupCircle{
    // CAShapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.lineWidth = 7;
    
    // 贝塞尔曲线
    UIBezierPath *thePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(circleCenterX, circleCenterY) radius:(screenWidth - 100)/2 startAngle:(M_PI) endAngle:(M_PI * 2) clockwise:YES];
    shapeLayer.path = thePath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    HZXWheelView *wheelView = [[HZXWheelView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:wheelView];
    
    /*
    // 初始化一个蓝点，沿着轨迹运动
    UIImageView *blueView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    blueView.image = [UIImage imageNamed:@"1"];
    [shapeLayer addSublayer:blueView.layer];
    
    // 创建沿着弧形运动的动画
    CAKeyframeAnimation *keyframeAnimation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation1.calculationMode = kCAAnimationPaced;
    keyframeAnimation1.fillMode = kCAFillModeForwards;
    keyframeAnimation1.removedOnCompletion = NO;
    keyframeAnimation1.duration = 10;
    keyframeAnimation1.repeatCount = 1;
    // 弧形轨迹 curvedPath1
    CGMutablePathRef curvedPath1 = CGPathCreateMutable();
    CGPathAddArc(curvedPath1, NULL, circleCenterX, circleCenterY, (screenWidth/2 + 50), M_PI_2 * 2, M_PI_2 * 2.5, 0);
    keyframeAnimation1.path = curvedPath1;
    CGPathRelease(curvedPath1);
//    [blueView.layer addAnimation:keyframeAnimation1 forKey:@"moveCircle"];
    // 第二个图片运动轨迹
    CAKeyframeAnimation *keyframeAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation2.calculationMode = kCAAnimationPaced;
    keyframeAnimation2.fillMode = kCAFillModeForwards;
    keyframeAnimation2.removedOnCompletion = NO;
    keyframeAnimation2.duration = 10;
    keyframeAnimation2.repeatCount = 1;
    // 弧形轨迹 curvedPath2
    CGMutablePathRef curvedPath2 = CGPathCreateMutable();
    CGPathAddArc(curvedPath2, NULL, circleCenterX, circleCenterY, (screenWidth/2 + 50), M_PI_2 * 2.5, M_PI_2 * 3, 0);
    keyframeAnimation2.path = curvedPath2;
    CGPathRelease(curvedPath2);
    // 第三个图片运动轨迹
    CAKeyframeAnimation *keyframeAnimation3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation3.calculationMode = kCAAnimationPaced;
    keyframeAnimation3.fillMode = kCAFillModeForwards;
    keyframeAnimation3.removedOnCompletion = NO;
    keyframeAnimation3.duration = 10;
    keyframeAnimation3.repeatCount = 1;
    // 弧形轨迹 curvedPath3
    CGMutablePathRef curvedPath3 = CGPathCreateMutable();
    CGPathAddArc(curvedPath3, NULL, circleCenterX, circleCenterY, (screenWidth/2 + 50), M_PI_2 * 3, M_PI_2 * 3.5, 0);
    keyframeAnimation3.path = curvedPath3;
    CGPathRelease(curvedPath3);
    
    // 图片旋转 image1
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth/2 - 50, 200, 60, 100)];
    imageView1.image = [UIImage imageNamed:@"timg1"];
    [self.view addSubview:imageView1];
    imageView1.transform = CGAffineTransformRotate(imageView1.transform, M_PI_2 * 3 );
    // image2
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth/2 - 50, 200, 60, 100)];
    imageView2.image = [UIImage imageNamed:@"timg2"];
    [self.view addSubview:imageView2];
    imageView2.transform = CGAffineTransformRotate(imageView2.transform, M_PI_2 * 3.5 );
    // image3
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth/2 - 50, 200, 60, 100)];
    imageView3.image = [UIImage imageNamed:@"timg3"];
    [self.view addSubview:imageView3];
    imageView3.transform = CGAffineTransformRotate(imageView3.transform, 0 );
    
    [UIView animateWithDuration:10 animations:^{
        imageView1.transform = CGAffineTransformRotate(imageView1.transform, M_PI_4);
        [imageView1.layer addAnimation:keyframeAnimation1 forKey:@"image1Path"];
        imageView2.transform = CGAffineTransformRotate(imageView2.transform, M_PI_4); // 转动90°
        [imageView2.layer addAnimation:keyframeAnimation2 forKey:@"image2Path"];
        imageView3.transform = CGAffineTransformRotate(imageView3.transform, M_PI_4);
        [imageView3.layer addAnimation:keyframeAnimation3 forKey:@"image3Path"];
    } completion:^(BOOL finished) {
        
    }]; */
}

- (void)setupFirstImage{
    
}

- (void)setupSecondImage{
    
}

- (void)setupThirdImage{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end




