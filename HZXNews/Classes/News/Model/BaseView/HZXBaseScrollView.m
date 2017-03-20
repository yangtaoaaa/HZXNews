//
//  HZXBaseScrollView.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/20.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXBaseScrollView.h"

@implementation HZXBaseScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
}

@end
