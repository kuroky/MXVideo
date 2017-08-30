//
//  EMAppDefine.m
//  ESignIn
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

#import "EMAppDefine.h"

#pragma mark App Server环境
EMEdition EMAppServerEdition                        =   1;

NSString * const EMEditionName[] = {
    [EMEditionAppStore] = @"Emucoo-AppStore",
    [EMEditionCn] = @"Emucoo-Cn",
    [EMEditionDev] = @"Emucoo-Dev",
};

#pragma mark -  App Id
NSString *const EMUmengAppkey                       =   @"5949f5dec62dca16550007d8";

NSString *const EMWXAppId                           =   @"wx8f66bdf6f4424972";

NSString *const EMWXAppSecret                       =   @"2f5f071824a53e0b63f62a1363087ae3";

NSString *const EMQQAppId                           =   @"1106052379";

NSString *const EMQQAppSecret                       =   @"rRkKZAjoShSXb69P";

NSString *const EMSinaAppId                         =   @"3353766000";

NSString *const EMSinaAppSecret                     =   @"3961b94973a9b65b92e88e9c82398bf1";

NSString *const EMTXBuglyKey                        =   @"39ae7a0dd8";

NSString *const kEMAMapKey                          =   @"fea27d47de85472ad0c55567359bd69f";

NSString *const EMRCAppKey                          =   @"m7ua80gbmpe0m";

NSString *const EMRCAppKeyCn                        =   @"vnroth0kvdlho";

NSString *const EMJPushAppkey                       =   @"d5cc1540766c274107c712c8";

NSString *const EMAppstoreID                        =   @"";

NSString *const EMBaseCNUrl                           =   @"http://test.emucoo.net";

NSString *const EMBaseUrl                           =   @"http://api.emucoo.net";

#pragma mark - NSNotification
NSString *const kNotificationUserLogin              =   @"NotificationUserLogin";

NSString *const kNotificationUserLogout             =   @"NotificationUserLogout";

NSString *const kNotificationTabbarClick            =   @"NotificationTabbarClick";

NSString *const kNotificationReceiveMsg             =   @"NotificationReceiveMsg";

NSString *const kNotificationTapChat             =   @"NotificationTapChat";

@implementation EMAppDefine

@end
