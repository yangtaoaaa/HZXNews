//
//  HZXReadViewController.m
//  HZXNews
//
//  Created by ycmedia_imac on 17/2/4.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import "HZXReadViewController.h"
#import "HZXWheelImageViewController.h"

@interface HZXReadViewController ()

@end

@implementation HZXReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"阅读";
    [self test];
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
    HZXWheelImageViewController *meVc = [[HZXWheelImageViewController alloc]init];
    [self.navigationController pushViewController:meVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end


