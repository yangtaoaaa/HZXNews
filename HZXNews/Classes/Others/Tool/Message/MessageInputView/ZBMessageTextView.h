//
//  MessageTextView.h
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-10.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZBTextViewInputViewType) {
    ZBTextViewNormalInputType = 0,
    ZBTextViewTextInputType,
    ZBTextViewFaceInputType,
    ZBTextViewShareMenuInputType
};

@interface ZBMessageTextView : UITextView

/**
 *  提示用户输入的标语
 **/
@property (nonatomic,copy) NSString *placeHolder;

/**
 *  标语文本的颜色
 **/
@property (nonatomic,strong) UIColor *placeHolderTextColor;

/**
 *  获取自身文本占据有多少行
 *
 *  @return 返回行数
 */
- (NSUInteger)numberOfLinesOfText;

/**
 *  获取每行的高度
 *
 *  @return 根据iPhone或者iPad来获取每行字体的高度
 */
+ (NSUInteger)maxCharactersPerLine;

/**
 *  获取某个文本占据自身适应宽带的行数
 *
 *  @param text 目标文本
 *
 *  @return 返回占据行数
 */
+ (NSUInteger)numberOfLinesForMessage:(NSString *)text;

@end
