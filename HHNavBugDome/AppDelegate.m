//
//  AppDelegate.m
//  HHNavBugDome
//
//  Created by caohuihui on 16/7/3.
//  Copyright © 2016年 caohuihui. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HHNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController *vc = [[ViewController alloc]init];
    vc.title = @"1";
    HHNavigationController *nav = [[HHNavigationController alloc]initWithRootViewController:vc];
    
    /*
     修复方法一
     最简单的禁用手势
     */
    //nav.interactivePopGestureRecognizer.enabled = NO;
    
    
    /*
     修复方法二
     协议签订，放在这里是为了方便大家看到。正常都是放在HHNavigationController的didLoadView方法里面的。
     在这里注释掉了，为了是重现bug，如果想要试验修复bug，将下面那行代码取消注释，或者到HHNavigationController的didLoadView取消self.delegate = self;注释
     */
    //nav.delegate = (id)nav;
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = nav;
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    return YES;
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
}

@end
