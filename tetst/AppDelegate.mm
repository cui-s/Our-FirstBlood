//
//  AppDelegate.m
//  tetst
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "AppDelegate.h"


#import "MBGPlatform.h"

#import "MobageDashboardViewController.h"
#import "GameCrossPromotionController.h"
#import "MobageNotificationQueue.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[MBGPlatform sharedPlatform] setDelegate:self withWindow:self.window withRootViewController:self.window.rootViewController];
    if ([MBGPlatform isProductionEnv]) {
        [MBGPlatform initialize:MBG_REGION_CN serverType:MBG_PRODUCTION
                    consumerKey:@"sdk_app_id:13000322" consumerSecret:@"1e2996f7687e1b3cb959b90c0efe0891" appId:@"13000322"];
    }else {
        [MBGPlatform initialize:MBG_REGION_CN serverType:MBG_SANDBOX
                    consumerKey:@"sdk_app_id:13000322" consumerSecret:@"8175f70a76ecbdeefa1e04a0c8d4ad04" appId:@"13000322"];
    }
    [MBGPlatform registerTick];
    [[MBGPlatform sharedPlatform] checkLoginStatus];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
