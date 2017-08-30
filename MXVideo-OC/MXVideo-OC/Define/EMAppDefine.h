//
//  EMAppDefine.h
//  ESignIn
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  App的server环境
 */
typedef NS_ENUM(NSUInteger, EMEdition) {
    /**
     *  AppStore正式
     */
    EMEditionAppStore               =   0,
    
    /**
     *  cn
     */
    EMEditionCn                     =   1,
    
    /**
     *  dev
     */
    EMEditionDev                    =    2,
};

extern EMEdition EMAppServerEdition;

extern NSString * const EMEditionName[];

/**
 评论类型
 
 - RemarkAddTypeTask: 任务评论
 - RemarkAddTypeNews: 新闻评论
 - RemarkAddTypeGood: 商品评论
 */
typedef NS_ENUM(NSInteger, RemarkAddType) {
    RemarkAddTypeTask                  =       1,
    RemarkAddTypeNews                  =       2,
    RemarkAddTypeGood                  =       3
};

#pragma mark - 第三方App Id
/**
 *  友盟Key
 */
extern NSString *const EMUmengAppkey;

/**
 *  微信AppId
 */
extern NSString *const EMWXAppId;

/**
 *  微信AppSecret
 */
extern NSString *const EMWXAppSecret;

/**
 *  QQ AppId
 */
extern NSString *const EMQQAppId;

/**
 *  QQ AppSecret
 */
extern NSString *const EMQQAppSecret;

/**
 *  微博 AppId
 */
extern NSString *const EMSinaAppId;

/**
 *  微博 AppSecret
 */
extern NSString *const EMSinaAppSecret;

/**
 腾讯bug平台
 */
extern NSString *const EMTXBuglyKey;

// 高德key
extern NSString *const kEMAMapKey;

/**
 融云key
 */
extern NSString *const EMRCAppKey;

/**
 融云key cn测试
 */
extern NSString *const EMRCAppKeyCn;

// jpush key
extern NSString *const EMJPushAppkey;

extern NSString *const EMAppstoreID;

extern NSString *const EMBaseCNUrl;

extern NSString *const EMBaseUrl;

#pragma mark - NSNotification
extern NSString *const kNotificationUserLogin;
extern NSString *const kNotificationUserLogout;
extern NSString *const kNotificationTabbarClick;
extern NSString *const kNotificationReceiveMsg;
extern NSString *const kNotificationTapChat;

@interface EMAppDefine : NSObject

@end
