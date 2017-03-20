//
//  HZXButtonChooseViewController.m
//  HZXNews
//
//  Created by 何紫璇 on 2017/3/9.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXButtonChooseViewController.h"
#import "HZXButtonChooseView.h"

#define kMarginW 20
#define kHeaderHeight 36


@interface HZXButtonChooseViewController ()

@property (strong, nonatomic) UIView *header;
@property (nonatomic, strong) HZXButtonChooseView *topChooseView;
@property (nonatomic, strong) HZXButtonChooseView *bottomChooseView;
@property (nonatomic, strong) UILabel *addLabel; // 点击添加更多标签

@end

@implementation HZXButtonChooseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubViews];
    }
    return self;
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self initSubViews];
//}

// 上面已经选择的标签
- (void)setSelectedArray:(NSMutableArray *)selectedArray{
    _selectedArray = selectedArray;
    if(_selectedArray != nil){
        for(NSString *name in _selectedArray){
            [_topChooseView addChooseButton:name];
        }
    }
}
// 下面没有选择的标签
- (void)setUnSelectedArray:(NSMutableArray *)unSelectedArray{
    _unSelectedArray = unSelectedArray;
    if(_unSelectedArray != nil){
//        for(NSString *name in _unSelectedArray){
//            [_bottomChooseView addChooseButton:name];
//        }
    }
}

- (void)initSubViews{
    [self prefersStatusBarHidden];
//    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];
    self.view.backgroundColor = RXColor(245, 205, 245, 0.5);
    // 放这个是为了做一个不透明的view，遮住标签栏
    _header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kHeaderHeight)];
    _header.backgroundColor = RXColor(245, 245, 245, 1);
    [self.view addSubview:_header];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kMarginW, 0, 80, kHeaderHeight)];
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"切换栏目";
    [_header addSubview:label];
    // 收起按钮
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width - kMarginW - kHeaderHeight, 0, 30, kHeaderHeight)];
    [button1 setImage:[UIImage imageNamed:@"channel_nav_arrow"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(spreadAction:) forControlEvents:UIControlEventTouchUpInside];
    [_header addSubview:button1];
    // 排序删除，完成
    UIButton *sortBtn = [[UIButton alloc]initWithFrame:CGRectMake(button1.x - 75, 0, 60, kHeaderHeight)];
    [sortBtn setTitle:@"排序完成" forState:UIControlStateNormal];
    sortBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [sortBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [sortBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [sortBtn setBackgroundImage:[UIImage imageNamed:@"channel_edit_button_bg"] forState:UIControlStateNormal];
    [sortBtn setBackgroundImage:[UIImage imageNamed:@"channel_edit_button_selected_bg"] forState:UIControlStateHighlighted];
    [sortBtn addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventTouchUpInside];
    [_header addSubview:sortBtn];
    // topButton和bottomButton
    _topChooseView = [[HZXButtonChooseView alloc]init];
    _topChooseView.frame = CGRectMake(0, CGRectGetMaxY(_header.frame), screenWidth, 200);
    _topChooseView.isDragable = YES;
    [self.view addSubview:_topChooseView];
    // “点击添加更多栏目"
    _addLabel = [[UILabel alloc]init];
    _addLabel.frame = CGRectMake(0, CGRectGetMaxY(_topChooseView.frame), screenWidth, 30);
    _addLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_addLabel];
    
    _bottomChooseView = [[HZXButtonChooseView alloc]init];
    _bottomChooseView.frame = CGRectMake(0, CGRectGetMaxY(_addLabel.frame), screenWidth, 300);
    [self.view addSubview:_bottomChooseView];
}

// 展示buttonChooseViewController
- (void)showInView:(UIView *)view{
    [view addSubview:self.view];
    CGRect frame = view.bounds;
//    HZXLog(@"view====%f, %f", view.y, view.height);
    frame.size.height = frame.size.height - 49;
    frame.origin.y = -frame.size.height;
    self.view.frame = frame;
    [UIView animateWithDuration:0.5 animations:^{
//        self.view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.view.y = 0;
    } completion:^(BOOL finished) {
        
    }];
    [self refreshView];
}

// 排序完成----响应事件
- (void)switchAction:(UIButton *)button{
    if ([button.titleLabel.text isEqualToString:@"排序删除"]) {
//        label.text = @"拖动排序";
        [button setTitle:@"完成" forState:UIControlStateNormal];
//        _topChooseView.edit = YES;
//        _bottomChooseView.hidden = YES;
    }else {
        if (button == nil) {
            return;
        }
//        label.text = @"切换栏目";
        [button setTitle:@"排序删除" forState:UIControlStateNormal];
//        _topChooseView.edit = NO;
//        _bottomChooseView.hidden = NO;
    }
}

// 收起
- (void)spreadAction:(UIButton *)button{
    [UIView animateWithDuration:0.5 animations:^{
        self.view.y = -self.view.height;
//        CGRect frame = self.view.frame;
//        frame.origin.y = -frame.size.height;
//        self.view.frame = frame;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

//在这里调整各个子view的尺寸，buttonChooseView的尺寸有其contentsize传出
- (void)refreshView
{
    [UIView animateWithDuration:0.5 animations:^{
        _topChooseView.frame = CGRectMake(0, CGRectGetMaxY(_header.frame), _topChooseView.contentSize.width, _topChooseView.contentSize.height);
        _addLabel.frame = CGRectMake(0, CGRectGetMaxY(_topChooseView.frame), self.view.frame.size.width, 30);
        _bottomChooseView.frame = CGRectMake(0, CGRectGetMaxY(_addLabel.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(_addLabel.frame));
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end






