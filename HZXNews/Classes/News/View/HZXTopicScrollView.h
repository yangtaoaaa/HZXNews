//
//  HZXTopicScrollView.h
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/20.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZXBaseScrollView.h"
#import "HZXButtonChooseViewController.h"
@protocol TopicScrollViewDelegate <NSObject>
- (void)topicScrollViewDidChanged:(NSArray *)selectedArray;
- (void)topicScrollViewDidSelectButton:(NSInteger)selectedButtonIndex;
@end


@interface HZXTopicScrollView : HZXBaseScrollView

@property (weak, nonatomic) id<TopicScrollViewDelegate> topicDelegate;
@property (strong, nonatomic) HZXButtonChooseViewController *buttonChooseVC;
@property (weak, nonatomic) NSArray *topicArray;
@property (assign, nonatomic) CGFloat offsetX;  //两个scrollView靠offsetX联系起来

@end

