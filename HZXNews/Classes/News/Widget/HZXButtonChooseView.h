//
//  HZXButtonChooseView.h
//  HZXNews
//
//  Created by 何紫璇 on 2017/3/9.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZXBaseScrollView.h"


@interface HZXButtonChooseView : HZXBaseScrollView

@property (assign, nonatomic, getter = isEdit) BOOL edit;
@property (nonatomic, assign) BOOL isDragable;
@property (strong, nonatomic) NSMutableArray *buttonArray;

- (void)addChooseButton:(NSString *)title;


@end
