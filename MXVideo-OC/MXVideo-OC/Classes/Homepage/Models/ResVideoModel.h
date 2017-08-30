//
//  ResVideoModel.h
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/30.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "EMBaseModel.h"

@interface ResVideoModel : EMBaseModel

/**
 名称
 */
@property (copy, nonatomic) NSString *name;

/**
 视频ID
 */
@property (copy, nonatomic) NSString *videoId;

/**
 播放地址
 */
@property (copy, nonatomic) NSString *videoUrl;

/**
 缩略图
 */
@property (copy, nonatomic) NSString *videoCover;

/**
 视频大小
 */
@property (copy, nonatomic) NSString *videoSize;

@end
