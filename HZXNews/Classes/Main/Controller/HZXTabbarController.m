//
//  RXTabBarViewController.m
//  RenXing
//
//  Created by ycmedia_imac on 16/3/11.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import "HZXNavigationController.h"
#import "HZXTabbarController.h"

#import "HZXNewsViewController.h"
#import "HZXReadViewController.h"
#import "HZXVideoViewController.h"
#import "HZXDiscoverViewController.h"
#import "HZXMeViewController.h"

#import "HZXTabbarView.h"

//

@interface HZXTabbarController ()<tabbarViewDelegate>

@property (nonatomic, strong) HZXTabbarView *tabbarView;
@end


@implementation HZXTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initChildVcs];
    [self initTabBarView];
//    [self test];
}

- (void)initChildVcs{
    [self setViewControllers:@[
                               
                                [[HZXNavigationController alloc]initWithRootViewController:[[HZXNewsViewController alloc]init]],
                                [[HZXNavigationController alloc]initWithRootViewController:[[HZXReadViewController  alloc]init]],
                                [[HZXNavigationController alloc]initWithRootViewController:[[HZXVideoViewController alloc]init]],
                                [[HZXNavigationController alloc]initWithRootViewController:[[HZXDiscoverViewController alloc]init]],
                                [[HZXNavigationController alloc]initWithRootViewController:[[HZXMeViewController alloc]init]],
                               ]];
}

- (void)initTabBarView{
    _tabbarView = [[HZXTabbarView alloc]initWithFrame:self.tabBar.bounds];
    _tabbarView.delegate = self;
    
    [_tabbarView addTabbarButtonWithTitle:@"新闻" imageName:@"tabbar_icon_news_normal" selImageName:@"tabbar_icon_news_highlight"];
    [_tabbarView addTabbarButtonWithTitle:@"阅读" imageName:@"tabbar_icon_reader_normal" selImageName:@"tabbar_icon_reader_highlight"];
    [_tabbarView addTabbarButtonWithTitle:@"视听" imageName:@"tabbar_icon_media_normal" selImageName:@"tabbar_icon_media_highlight"];
    [_tabbarView addTabbarButtonWithTitle:@"发现" imageName:@"tabbar_icon_found_normal" selImageName:@"tabbar_icon_found_highlight"];
    [_tabbarView addTabbarButtonWithTitle:@"我" imageName:@"tabbar_icon_me_normal" selImageName:@"tabbar_icon_me_highlight"];
    [self.tabBar addSubview:_tabbarView];
}

- (void)tabbar:(HZXTabbarView *)tabbarView selBtnFrom:(NSInteger)from to:(NSInteger)to{
//    HZXLog(@"from====%ld, to====%ld", from, to);
    self.selectedIndex = to;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end









