//
//  HZXButtonChooseView.m
//  HZXNews
//
//  Created by 何紫璇 on 2017/3/9.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#define kButtonW 70
#define kButtonH 30
#define kMarginW            ([UIScreen mainScreen].bounds.size.width - 4 *kButtonW) / 5
#define kMarginH            10

#import "HZXButtonChooseView.h"
#import "HZXChooseButton.h"

@interface HZXButtonChooseView()

@property (nonatomic, strong) HZXChooseButton *placeHolder;

@end

@implementation HZXButtonChooseView

- (NSMutableArray *)buttonArray
{
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor redColor];
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{
    
}

- (void)addChooseButton:(NSString *)title{
    CGSize buttonSize = CGSizeMake(kButtonW,kButtonH);
    
    HZXChooseButton *button = [[HZXChooseButton alloc] initWithFrame:(CGRect){CGPointMake(0, 0), buttonSize}];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (self.isDragable) {
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(buttonLongPressed:)];
        [button addGestureRecognizer:longGesture];
    }
    button.edit = NO;
    [self addSubview:button];
    [self.buttonArray addObject:button];
    
    [self refreshView];
}

- (void)setEdit:(BOOL)edit
{
    _edit = edit;
    for (HZXChooseButton *button in self.buttonArray) {
        button.edit = _edit;
    }
}

- (void)buttonLongPressed:(UILongPressGestureRecognizer *)sender{
    HZXChooseButton *button = (HZXChooseButton *)sender.view;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:{
            self.edit = YES;
            if(_placeHolder == nil){
                _placeHolder = [[HZXChooseButton alloc]initWithFrame:button.frame];
                [self.buttonArray insertObject:_placeHolder atIndex:[self.buttonArray indexOfObject:button]];
                [self.buttonArray removeObject:button];
            }
            break;
        }
        case UIGestureRecognizerStateChanged:{
            CGPoint newPoint = [sender locationInView:self];
            button.center = CGPointMake(newPoint.x, newPoint.y);
            // 检测是否进入其他button区域
            NSInteger newIndex = [self indexOfButtonWithMovingButton:button];
            if(newIndex >= 0){
                [self.buttonArray removeObject:_placeHolder];
                [self.buttonArray insertObject:_placeHolder atIndex:newIndex];
            }
            break;
        }
        case UIGestureRecognizerStateEnded:{
            if(_placeHolder != nil){
                [self.buttonArray replaceObjectAtIndex:[self.buttonArray indexOfObject:_placeHolder] withObject:button];
                _placeHolder = nil;
            }
        }
        default:
            break;
    }
    [self refreshView];
}

// 判断一个point是否在另一个view的rect内，在的话就返回view的tag值
- (NSInteger)indexOfButtonWithMovingButton:(HZXChooseButton *)movingButton{
    for (int i = 0; i < self.buttonArray.count; i++) {
        HZXChooseButton *button = self.buttonArray[i];
        if(button != movingButton){
            if(CGRectContainsPoint(button.frame, movingButton.center)){ // movintButton的center而不是frame
                return i;
            }
        }
    }
    return -1;
}

- (void)selectWithButton:(HZXChooseButton *)button{
    //
}

- (void)refreshView{
    [UIView animateWithDuration:0.5 animations:^{
        for (int i  = 0; i < self.buttonArray.count; i++) {
            HZXChooseButton *button = self.buttonArray[i];
            CGFloat buttonX = 0;
            CGFloat buttonY = 0;
            if (i == 0) {
                buttonX = kMarginW;
                buttonY = kMarginH;
            }else {
                HZXChooseButton *foreButton = self.buttonArray[i - 1];
                buttonX = CGRectGetMaxX(foreButton.frame) + kMarginW;
                buttonY = foreButton.frame.origin.y;
                if (buttonX + button.bounds.size.width > screenWidth) {
                    buttonX = kMarginW;
                    buttonY = CGRectGetMaxY(foreButton.frame) + kMarginH;
                }
            }
            button.frame = (CGRect){CGPointMake(buttonX, buttonY), button.bounds.size};
            
            //根据最后一个button设置本self的frame和contentsize
            if (i == self.buttonArray.count - 1) {
                CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, CGRectGetMaxY(button.frame) + kMarginH);
                self.contentSize = size;
            }
        }
        if (self.buttonArray.count == 0) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0);
            self.contentSize = CGSizeZero;
        }
    }];
}




@end
