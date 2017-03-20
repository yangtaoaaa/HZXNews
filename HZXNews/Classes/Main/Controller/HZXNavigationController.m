//
//  RXNavigationController.m
//  RenXing
//
//  Created by ycmedia_imac on 16/3/11.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import "HZXNavigationController.h"
#import "HZXTabbarController.h"

@interface HZXNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation HZXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 清空手势代理, 然后就会重新出现手势移除控制器的功能
    self.interactivePopGestureRecognizer.delegate = self;
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navbar_netease"]];
}

+ (void)initialize{
        // 取出appearance对象，appearance一般是全部改变
        UINavigationBar *navBar = [UINavigationBar appearance];
        // 设置背景
        [navBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
        
        // 设置标题属性
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = RXColor(33, 33, 33, 1);
        textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:19];
        [navBar setTitleTextAttributes:textAttrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if(self.tabBarController.viewControllers.count > 0)
    {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    if(self.viewControllers.count > 0){
        // 设置背景
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"白色图片"] forBarMetrics:UIBarMetricsDefault];
        
        // 设置标题属性
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = RXColor(33, 33, 33, 1);
        textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:19];
        [self.navigationBar setTitleTextAttributes:textAttrs];
        
        viewController.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"back" highIcon:@"back" target:self action:@selector(back)];
    }
//    HZXLog(@"viewController = %@", viewController);
    [super pushViewController:viewController animated:YES];
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
//    HZXLog(@"控制器的个数是====%@", self.viewControllers);
//    if([self.viewControllers.firstObject isKindOfClass:[HZXTabbarController class]] && self.viewControllers.count == 2){
//        // 设置背景
//        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar"] forBarMetrics:UIBarMetricsDefault];
//    }
    return [super popViewControllerAnimated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated{
    // 取出appearance对象，appearance一般是全部改变
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    NSArray *arr = [super popToRootViewControllerAnimated:animated];
    
    return arr;
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 如果只有一个子控制器, 就禁止掉pop手势
    //    if (self.childViewControllers.count == 1) return NO;
    //    return YES;
//    NSLog(@"当前控制器的子控制器个数是%@", self.childViewControllers);
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
//    HZXLog(@"控制器是%@", self.topViewController);
    return self.childViewControllers.count > 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end




