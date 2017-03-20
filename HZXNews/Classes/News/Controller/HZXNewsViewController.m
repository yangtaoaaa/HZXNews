//
//  HZXNewsViewController.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/4.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXNewsViewController.h"
#import "HZXMeViewController.h"
// 头部标签栏
#import "HZXNewsScrollView.h"
#import "HZXTopicHeaderView.h"

//HZXNewsVC
#define kTopicHeaderHeight      36

@interface HZXNewsViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) HZXNewsScrollView *newsScrollView;
@end

@implementation HZXNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"新闻";
    [self setupSubviews];
}

// 初始化头部标签栏
- (void)setupSubviews{
    // 下面的scrollView
    _newsScrollView = [[HZXNewsScrollView alloc]init];
    _newsScrollView.frame = CGRectMake(0, kTopicHeaderHeight, screenWidth, screenHeight - 49 - 64 - kTopicHeaderHeight);
    _newsScrollView.delegate = self;
    [self.view addSubview:_newsScrollView];
    // 上面的导航条
    HZXTopicHeaderView *topicHeader = [[HZXTopicHeaderView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, kTopicHeaderHeight)];
//    topicHeader.backgroundColor = [UIColor greenColor];
    [self.view addSubview:topicHeader];
}

- (void)test{
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(60, 100, 100, 30);
    testBtn.backgroundColor = [UIColor lightGrayColor];
    [testBtn setTitle:@"测试" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [testBtn addTarget:self action:@selector(testBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}

- (void)testBtnClick{
    HZXMeViewController *meVc = [[HZXMeViewController alloc]init];
    [self.navigationController pushViewController:meVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





@end
