//
//  ZBFaceView.h
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-13.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>

@protocol ZBFaceViewDelegate <NSObject>
@optional

/*
 * 点击表情代理
 * @param faceName 表情对应的名称
 * @param del      是否点击删除
 *
 */
- (void)didSelecteFace:(NSString *)faceName andIsSelecteDelete:(BOOL)del;

@end

@interface ZBFaceView : UIView

@property (nonatomic,weak) id<ZBFaceViewDelegate>delegate;

/*
 * 初始化表情页面
 * @param frame     大小
 * @param indexPath 创建第几个
 *
 */
- (id)initWithFrame:(CGRect)frame forIndexPath:(NSInteger)index;

@end
