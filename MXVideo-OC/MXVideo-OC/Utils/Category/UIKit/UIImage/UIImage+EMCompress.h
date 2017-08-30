//
//  UIImage+EMCompress.h
//  Emucoo
//
//  Created by kuroky on 2017/6/21.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EMImageQuality) {
    EMImageQualityNomal                 =       1,
    EMImageQualityLow                   =       2
};

/**
 图片压缩
 */
@interface UIImage (EMCompress)

/**
 图片压缩

 @param quality 图片质量
 @param completion block
 */
- (void)em_compressQuality:(EMImageQuality)quality
                completion:(void (^)(UIImage *pressImg))completion;

@end
