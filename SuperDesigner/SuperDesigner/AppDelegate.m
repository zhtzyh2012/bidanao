//
//  AppDelegate.m
//  SuperDesigner
//
//  Created by Julia on 2017/6/7.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "AppDelegate.h"
#import "BDTabBarController.h"

//收起系统键盘
#import "IQKeyboardManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    //初始化一个window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置一下根控制器
//    UITabBarController *tabCtr = [[UITabBarController alloc] init];
//    
//    UITabBarController *homeCtr = [[UITabBarController alloc] init];
//    homeCtr.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
//    homeCtr.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];
//    homeCtr.tabBarItem.title = @"首页";
//    
//    [tabCtr addChildViewController:homeCtr];
    
    self.window.rootViewController = [[BDTabBarController alloc] init];
    
    //让其显示成为主窗口
    [self.window makeKeyAndVisible];
    
    [self adaptiOSEleven];
    
    return YES;
}


-(void) adaptiOSEleven {
    
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
        
    }
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
