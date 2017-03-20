//
//  HZXChooseButton.m
//  HZXNews
//
//  Created by 何紫璇 on 2017/3/16.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXChooseButton.h"
#define kButtonW 70
#define kButtonH 30

@interface HZXChooseButton()
@property (nonatomic, strong)UIImageView *deleteImageView;
@end

@implementation HZXChooseButton

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview{
    self.size = CGSizeMake(kButtonW, kButtonH);
    [self setBackgroundImage:[UIImage imageNamed:@"channel_grid_circle"] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    _deleteImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-3, -3, 15, 15)];
    _deleteImageView.image = [UIImage imageNamed:@"channel_edit_delete"];
    _deleteImageView.hidden = YES;
    [self addSubview:_deleteImageView];
}

- (void)setEdit:(BOOL)edit
{
    _edit = edit;
    if (_edit == YES) {
        _deleteImageView.hidden = NO;
    }else {
        _deleteImageView.hidden = YES;
    }
}


@end
