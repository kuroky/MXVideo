//
//  EMBaseRequest.m
//  Emucoo
//
//  Created by kuroky on 2017/6/22.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMBaseRequest.h"

@implementation EMBaseRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.ignoreTokenInHeader = NO;
}

- (NSTimeInterval)requestTimeoutInterval {
    return 15;
}

- (void)em_requestWithCompletion:(void (^)(EMResponse *response))completion {
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        EMResponse *response = [EMResponse parserResponseData:request.responseData];
        [self logHttpInfo:request response:response];
        if (completion) {
            completion(response);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        EMResponse *response;
        NSInteger statusCode = request.response.statusCode;
        if (statusCode == 400) {
            response = [EMResponse parserFailResponseData:request.responseData];
        }
        else {
            response = [EMResponse parseNetworkError:statusCode];
        }
        [self logHttpInfo:request response:response];
        if (completion) {
            completion(response);
        }
    }];
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    if (!self.ignoreTokenInHeader) {
//        NSString *token = [EMUserData sharedUser].personInfo.accessToken;
//        NSString *merchantId = [EMUserData sharedUser].personInfo.merchantId;
//        NSString *userId = [EMUserData sharedUser].personInfo.userId;        
//        [headers setValue:token forKey:@"access_token"];
//        [headers setValue:merchantId forKey:@"merchant_id"];
//        [headers setValue:userId forKey:@"user_id"];
    }
    return headers;
}

- (void)logHttpInfo:(YTKBaseRequest *)request
           response:(EMResponse *)response {
    NSString *url = [[YTKNetworkConfig sharedConfig].baseUrl stringByAppendingString:request.requestUrl];
    id para = request.requestArgument;
    if (!para) {
        para = @{};
    }
    
    if (response.isSuccess) {
        DDLogDebug(@"requestUrl: %@\n parameters: %@\n response: %@", url, para, response);
    }
    else {
        NSString *title = [NSString stringWithFormat:@"接口异常 request: %@ para: %@", request.requestUrl, para];
        [[EMProgressHUD sharedHUD] toastTitle:title];
        DDLogError(@"requestUrl: %@\n parameters: %@\n response: %@", url, para, response);
    }
}

@end
