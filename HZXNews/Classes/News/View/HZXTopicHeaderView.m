//
//  HZXTopicHeaderView.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/20.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXTopicHeaderView.h"
#import "HZXTopicScrollView.h"
#import "HZXBaseButton.h"
#define kButtonW         40

@interface HZXTopicHeaderView()

@property (nonatomic, strong) HZXTopicScrollView *topicScrollView;

@end

@implementation HZXTopicHeaderView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupView];
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setupView{
    CGRect frame = self.frame;
    _topicScrollView = [[HZXTopicScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - kButtonW, frame.size.height)];
    [self addSubview:_topicScrollView];
    
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navbar_left_more"]];
    leftView.frame = (CGRect){CGPointZero, leftView.frame.size};
    [self addSubview:leftView];
    
    UIImageView *rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navbar_right_more"]];
    rightView.frame = (CGRect){CGPointMake(frame.size.width - rightView.bounds.size.width - kButtonW, 0), rightView.frame.size};
    [self addSubview:rightView];
    
    UIButton *spreadButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - kButtonW, 0, kButtonW, frame.size.height)];
    spreadButton.imageView.transform = CGAffineTransformMakeScale(1, -1);
    spreadButton.backgroundColor = [UIColor clearColor];
    [spreadButton setImage:[UIImage imageNamed:@"channel_nav_arrow"] forState:UIControlStateNormal];
    [spreadButton addTarget:self action:@selector(spreadChooseView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:spreadButton];
}

- (void)spreadChooseView:(UIButton *)sender
{
    //showInView
    [_topicScrollView.buttonChooseVC showInView:self.superview];
}


@end





