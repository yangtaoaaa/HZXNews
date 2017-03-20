//
//  HZXButtonChooseViewController.h
//  HZXNews
//
//  Created by 何紫璇 on 2017/3/9.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HZXButtonChooseDelegate <NSObject>
- (void)buttonChooseViewDidSelected:(NSString *)tname;
- (void)buttonChooseViewTopicArrayDidChange:(NSArray *)topicArray;
@end


@interface HZXButtonChooseViewController : UIViewController

@property (weak, nonatomic) id<HZXButtonChooseDelegate> topicDelegate;
@property (strong, nonatomic) NSMutableArray *selectedArray;//装字典----上面已经选择的
@property (strong, nonatomic) NSMutableArray *unSelectedArray;//装字典----下面没有选择的


- (void)showInView:(UIView *)view;

@end
