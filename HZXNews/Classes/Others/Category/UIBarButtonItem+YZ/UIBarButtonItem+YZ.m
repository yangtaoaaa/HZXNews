//
//  UIBarButtonItem+YZ.m
//  ez
//
//  Created by apple on 14-8-15.
//  Copyright (c) 2014年 9ge. All rights reserved.
//

#import "UIBarButtonItem+YZ.h"
#import "HZXBaseButton.h"
@implementation UIBarButtonItem (YZ)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    HZXBaseButton *button = [HZXBaseButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size.width + 5, button.currentBackgroundImage.size.height + 3};//button.currentBackgroundImage.size
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = [UIColor greenColor];
    UIView *backView = [[UIView alloc]initWithFrame:button.bounds];
    backView.bounds = CGRectOffset(backView.bounds, 0, 3);
    [backView addSubview:button];
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:backView];
    return barBtnItem;
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    HZXBaseButton *button = [HZXBaseButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:RXColor(51, 51, 51, 1) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.frame = (CGRect){CGPointZero, button.titleLabel.size};
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
