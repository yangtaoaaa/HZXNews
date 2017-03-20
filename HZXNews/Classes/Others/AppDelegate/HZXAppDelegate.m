//
//  AppDelegate.m
//  RenXing
//
//  Created by ycmedia_imac on 16/3/11.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import "HZXAppDelegate.h"
#import "HZXTabbarController.h"
#import "HZXNavigationController.h"



@interface HZXAppDelegate ()

@end

@implementation HZXAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    // 设置根控制器
    self.window.rootViewController = [[HZXTabbarController alloc]init];
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSData *)requestSynchronousDataWithRequest:(NSURLRequest *)request{
    
    __block NSData * data;
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    void (^completion)(NSData * , NSURLResponse * , NSError * ) = ^(NSData * taskData, NSURLResponse * response, NSError * error){
        
        data = taskData;
        dispatch_semaphore_signal(sem);
        
    };
    NSURLSessionDataTask * task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:completion];
    
    [task resume];
    dispatch_semaphore_wait(sem,DISPATCH_TIME_FOREVER);
    
    return data;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
}

@end






