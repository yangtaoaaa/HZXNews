//
//  HZXTopicScrollView.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/20.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXTopicScrollView.h"

@interface HZXTopicScrollView()<HZXButtonChooseDelegate>

@property (nonatomic, strong) NSMutableArray *selectedArray;
@property (nonatomic, strong) NSMutableArray *unSelectedArray;

@end

@implementation HZXTopicScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        _selectedArray = [NSMutableArray arrayWithObjects:@"头条", @"美女", @"汽车", @"上海", @"直播", @"杂谈", @"段子", @"趣事", @"好吧", nil];
        _unSelectedArray = [NSMutableArray arrayWithObjects:@"888", @"88", @"666", @"444", @"555", @"333", @"999", @"222", @"111", nil];
        [self loadData];
//        [self registerNotification];
    }
    return self;
}
#pragma mark - 初始化
- (void)setupUI
{
    [super setupUI];
    _buttonChooseVC = [[HZXButtonChooseViewController alloc] init];
    _buttonChooseVC.topicDelegate = self;
}

- (void)loadData
{
    //网络获取topicList
    _buttonChooseVC.selectedArray = _selectedArray;
    _buttonChooseVC.unSelectedArray = _unSelectedArray;
    self.topicArray = _buttonChooseVC.selectedArray;
    [self.topicDelegate topicScrollViewDidChanged:_buttonChooseVC.selectedArray];
    //相关赋值
}

- (void)setTopicArray:(NSArray *)topicArray{
    for(int i = 0; i < _selectedArray.count; i++){
        HZXBaseButton *btn = [[HZXBaseButton alloc]init];
        [btn setTitle:_selectedArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.width = screenWidth / 5;
        btn.height = self.height;
        btn.x = i * btn.width;
        btn.y = 0;
        [self addSubview:btn];
    }
    self.contentSize = CGSizeMake(CGRectGetMaxX(self.subviews.lastObject.frame), 0);
}

#pragma mark - WYButtonChooseDelegate
- (void)buttonChooseViewTopicArrayDidChange:(NSArray *)topicArray
{
    self.topicArray = _buttonChooseVC.selectedArray;
    [self.topicDelegate topicScrollViewDidChanged:_buttonChooseVC.selectedArray];
}






@end



