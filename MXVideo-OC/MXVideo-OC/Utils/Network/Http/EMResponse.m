//
//  EMResponse.m
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMResponse.h"
#import "AFURLResponseSerialization.h"

@interface EMResponse ()

@property (nonatomic, readwrite) BOOL isSuccess;
@property (nonatomic, readwrite) NSInteger errCode;
@property (nonatomic, copy, readwrite) NSString *errMsg;
@property (nonatomic, strong, readwrite) NSDictionary *respData;

@end

@implementation EMResponse

#pragma mark - 接口200
+ (EMResponse *)parserResponseData:(NSData *)data {
    NSDictionary *item = [EMResponse dicDataFromJson:data];
    EMResponse *response = [EMResponse new];
    response.errCode = 0;
    response.isSuccess = YES;
    response.respData = item;
    response.errMsg = @"";
    return response;
}

+ (EMResponse *)parserFailResponseData:(NSData *)data {
    NSDictionary *dic = [EMResponse dicDataFromJson:data];
    NSString *msg = dic[@"msg"];
    EMResponse *response = [EMResponse new];
    response.isSuccess = NO;
    response.errCode = [dic[@"code"] integerValue];
    response.respData = dic[@"data"];
    response.errMsg = msg;
    return response;
}

+ (id)dicDataFromJson:(NSData *)jsonData {
    if (!jsonData) {
        return @{};
    }
    id item = [NSJSONSerialization JSONObjectWithData:jsonData
                                              options:NSJSONReadingAllowFragments
                                                error:nil];
    if (!item) {
        return @{};
    }
    
    if ([item isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)item;
    }
    else if ([item isKindOfClass:[NSArray class]]) {
        return @{@"item": item};
    }
    else {
        return @{};
    }
}

#pragma mark - 超时
+ (EMResponse *)parseNetworkError:(NSInteger)errCode {
    EMResponse *response = [EMResponse new];
    response.errCode = errCode;
    response.respData = nil;
    response.errMsg = [@"网络异常-" stringByAppendingString:@(errCode).stringValue];
    return response;
}

- (NSString *)description {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:_errMsg forKey:@"errMsg"];
    [data setValue:@(_errCode) forKey:@"errCode"];
    [data setValue:_respData forKey:@"data"];
    return [NSString stringWithFormat:@"<%@:%p>:%@",[self class], &self, data];
}

- (NSString *)debugDescription {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:_errMsg forKey:@"errMsg"];
    [data setValue:@(_errCode) forKey:@"errCode"];
    [data setValue:_respData forKey:@"data"];
    return [NSString stringWithFormat:@"<%@:%p>:%@",[self class], &self, data];
}

@end
