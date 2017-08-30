//
//  EMBaseRequest.h
//  Emucoo
//
//  Created by kuroky on 2017/6/22.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "EMResponse.h"

@interface EMBaseRequest : YTKRequest

- (void)em_requestWithCompletion:(void (^)(EMResponse *response))completion;

/**
 请求header中不需要token
 */
@property (nonatomic, assign, getter = isIgnoreTokenInHeader) BOOL ignoreTokenInHeader;

@end
