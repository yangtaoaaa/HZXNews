//
//  HZXTabbarView.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/6.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXTabbarView.h"
#import "HZXTabbarButton.h"

@interface HZXTabbarView()

@property (nonatomic, strong) HZXTabbarButton *selectedBtn;
@property (nonatomic, strong) NSMutableArray *btnArr;
@end


@implementation HZXTabbarView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
    }
    return self;
}

// 添加一个tabbarButton
- (void)addTabbarButtonWithTitle:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName{
    HZXTabbarButton *tabbarButton = [[HZXTabbarButton alloc]init];
    [tabbarButton setTitle:title forState:UIControlStateNormal];
    [tabbarButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [tabbarButton setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
    [self addSubview:tabbarButton];
    // 监听button点击
    [tabbarButton addTarget:self action:@selector(tabbarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    NSInteger count = self.subviews.count;
//    HZXTabbarButton *curTabbarButton = self.subviews[self.subviews.count-1];
    if(count == 1){
        [self tabbarButtonClick:tabbarButton];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    for(int i = 0; i < count; i++){
        HZXTabbarButton *curTabbarButton = self.subviews[i];
        curTabbarButton.width = self.width / count;
//        HZXLog(@"tabbarButton====%lf", curTabbarButton.width);
        curTabbarButton.height = self.height;
        curTabbarButton.x = curTabbarButton.width * i;
        curTabbarButton.y = self.y;
        curTabbarButton.tag = i;
    }
}

#pragma mark 监听button点击
- (void)tabbarButtonClick:(HZXTabbarButton *)tabbarButton{
    if(self.delegate && [self.delegate respondsToSelector:@selector(tabbar:selBtnFrom:to:)]){
        [self.delegate tabbar:self selBtnFrom:_selectedBtn.tag to:tabbarButton.tag];
    }
    _selectedBtn.selected = NO;
    tabbarButton.selected = YES;
    _selectedBtn = tabbarButton;
}



@end


