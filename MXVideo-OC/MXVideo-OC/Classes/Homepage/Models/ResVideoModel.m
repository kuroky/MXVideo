//
//  ResVideoModel.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/30.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "ResVideoModel.h"

@implementation ResVideoModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"videoId": @"id",
             @"videoUrl": @"res_url",
             @"videoCover": @"pic",
             @"videoSize": @"size_string"};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    if ([_videoCover hasPrefix:@"https"]) {
        _videoCover = [_videoCover stringByReplacingOccurrencesOfString:@"https"
                                                             withString:@"http"];
    }
    return YES;
}

@end
