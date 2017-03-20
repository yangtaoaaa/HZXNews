//
//  MessageFaceView.h
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-12.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>
#import "ZBFaceView.h"

@protocol ZBMessageManagerFaceViewDelegate <NSObject>

- (void)SendTheFaceStr:(NSString *)faceStr isDelete:(BOOL)dele;

@end

@interface ZBMessageManagerFaceView : UIView<UIScrollViewDelegate,ZBFaceViewDelegate>

@property (nonatomic,weak)id<ZBMessageManagerFaceViewDelegate>delegate;

@end
