//
//  LaunchConfig.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/28.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "LaunchConfig.h"
#import "IQKeyBoardManager.h"
#import "EMLogFormatter.h"
#import "MXFileManager.h"
#import <Bugly/Bugly.h>
#import <YTKNetwork.h>

@implementation LaunchConfig

+ (void)mx_launchSetup {
    [[DDTTYLogger sharedInstance] setLogFormatter:[EMLogFormatter new]];
    
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    
    [[MXFileManager sharedManager] mx_fileSetup];
    
    BuglyConfig *bConfig = [BuglyConfig new];
    bConfig.channel = @"appStore";
    bConfig.version = kAppVerison;
    [Bugly startWithAppId:EMTXBuglyKey config:bConfig];
    
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.debugLogEnabled = YES;
    config.baseUrl = @"https://api.tuxiaobei.com";
}

@end
