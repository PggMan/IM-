//
//  AppDelegate.m
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/1/27.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import "AppDelegate.h"
#import <RongIMLib/RongIMLib.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[RCIMClient sharedRCIMClient] initWithAppKey:@"m7ua80gbuxu7m"];
      return YES;
}
@end
