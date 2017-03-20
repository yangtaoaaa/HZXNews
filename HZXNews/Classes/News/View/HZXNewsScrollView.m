//
//  HZXNewsScrollView.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/20.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXNewsScrollView.h"

@implementation HZXNewsScrollView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.pagingEnabled = YES;
    }
    return self;
}

@end
