//
//  HZXTabbarView.h
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/6.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZXTabbarView;

@protocol tabbarViewDelegate <NSObject>
@optional
- (void)tabbar:(HZXTabbarView *)tabbarView selBtnFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface HZXTabbarView : UIView

// 代理
@property (nonatomic, weak) id<tabbarViewDelegate>delegate;
// 添加一个tabbar
- (void)addTabbarButtonWithTitle:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName;

@end

