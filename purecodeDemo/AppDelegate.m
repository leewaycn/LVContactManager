//
//  AppDelegate.m
//  purecodeDemo
//
//  Created by 孔友夫 on 2018/5/15.
//  Copyright © 2018年 LeeJay. All rights reserved.
//

#import "AppDelegate.h"
#import "homeViewController.h"
#import "naviViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)setNav
{
    [UINavigationBar appearance].barTintColor = [UIColor orangeColor];

    UINavigationBar *bar = [UINavigationBar appearance];
    //设置显示的颜色
    bar.barTintColor = [UIColor orangeColor];
    //设置字体颜色
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    //或者用这个都行
    //    [bar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];


    //适配ios11
    if (@available(ios 11.0,*)) {

//        return;
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {



    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window .backgroundColor = [UIColor whiteColor];

    [self setNav];

    homeViewController *home = [[homeViewController alloc]init];

    naviViewController *homeNAVi = [[naviViewController alloc]initWithRootViewController:home];
    self.window.rootViewController  = homeNAVi;

    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
