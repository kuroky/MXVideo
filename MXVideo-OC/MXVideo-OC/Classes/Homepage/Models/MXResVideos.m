//
//  MXResVideos.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/30.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "MXResVideos.h"

@implementation MXResVideos

- (NSString *)requestUrl {
    return @"/res/videos";
}

- (id)requestArgument {
    return @{@"tid": @"1",
             @"pageSize": @"20",
             @"page": @"1",
             @"keyword": @"",
             @"order": @"recommend",
             @"ver": @"1.8",
             @"https": @"1",
             @"app": @"erge"};
}

@end
