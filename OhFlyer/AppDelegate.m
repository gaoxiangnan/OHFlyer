//
//  AppDelegate.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/4.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import "AppDelegate.h"
#import "WPTabBarController.h"
#import "FZHTabbarController.h"


@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //关于键盘，点击屏幕空白处自动回收
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    //关闭键盘的自定义toolbar
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    
//    //友盟APPKey
//    [UMSocialData openLog:YES];
//    [UMSocialData setAppKey:UMAPPKey];
//    [UMSocialWechatHandler setWXAppId:@"wx67ab8e1adf450d23" appSecret:@"c596bf1411912332deffe9a9fd8e15c1" url:@"www.ohflyer.com"];
//    [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    
    
    
    self.window.rootViewController = [[FZHTabbarController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    
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
