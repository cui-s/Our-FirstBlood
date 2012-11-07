//
//  AppDelegate.h
//  tetst
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <UIKit/UIKit.h>



#import "MBGSocialService.h"
#import "GameCrossPromotionDelegate.h"
#import "MobageDashboardDelegate.h"
#import "MBGPlatform.h"
#import "ViewController.h"

@interface AppDelegate : NSObject <UIApplicationDelegate, MBGPlatformDelegate, MobageDashboardDelegate, GameCrossPromotionDelegate>


@property (strong, nonatomic) UIWindow *window;

@end
