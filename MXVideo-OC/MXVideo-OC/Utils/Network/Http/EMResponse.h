//
//  EMResponse.h
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMResponse : NSObject

/**
 请求成功
 */
@property (nonatomic, readonly) BOOL isSuccess;

/**
 返回码
 */
@property (nonatomic, readonly) NSInteger errCode;

/**
 报错信息
 */
@property (nonatomic, copy, readonly) NSString *errMsg;

/**
 业务数据
 */
@property (nonatomic, strong, readonly) NSDictionary *respData;

/**
 解析网络请求数据
 
 @param data 返回的数据
 @return EMResponse数据
 */
+ (EMResponse *)parserResponseData:(NSData *)data;

/**
 解析异常错误网络请求数据

 @param data 接口数据
 @return EMResponse
 */
+ (EMResponse *)parserFailResponseData:(NSData *)data;

/**
 解析网络异常时数据
 
 @param errCode 异常码
 @return EMResponse数据
 */
+ (EMResponse *)parseNetworkError:(NSInteger)errCode;

@end
