//
//  UIBarButtonItem+YZ.h
//  ez
//
//  Created by apple on 14-8-15.
//  Copyright (c) 2014年 9ge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YZ)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end
