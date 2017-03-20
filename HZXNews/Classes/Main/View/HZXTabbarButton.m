//
//  HZXTabbarButton.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/6.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXTabbarButton.h"
// 文字的高度比例
#define kTitleRatio 0.3

@interface HZXTabbarButton()

@end


@implementation HZXTabbarButton

- (id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:RXColor(163, 163, 163, 1) forState:UIControlStateNormal];
        [self setTitleColor:RXColor(221, 50, 55, 1) forState:UIControlStateSelected];
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

#pragma mark aotolayout
- (void)layoutSubviews{
    [super layoutSubviews];
    // image 居中
//    self.imageView.centerX = self.centerX;
    self.imageView.y = 2;
    self.imageView.x = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.height * (1 - kTitleRatio) - 3;
    // text 居中并设置frame
    CGRect newFrame = self.titleLabel.frame;
    newFrame.origin.x = 0;
    newFrame.size.height = self.height * kTitleRatio;
    newFrame.origin.y = self.height - newFrame.size.height - 3;
    newFrame.size.width = self.size.width;
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

// 禁止高亮状态
- (void)setHighlighted:(BOOL)highlighted{
}







@end




