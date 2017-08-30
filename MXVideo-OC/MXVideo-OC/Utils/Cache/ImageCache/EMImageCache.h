//
//  EMImageCache.h
//  Emucoo
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMImageCache : NSObject

+ (instancetype)sharedCache;

/**
 清理 SDWebImageManager的缓存
 */
- (void)em_clearCacheCompletion:(void (^)(BOOL completion))completion;

/**
 获取SDWebImageManager缓存大小
 
 @return 单位:字节
 */
- (NSUInteger)em_getCacheSize;

/**
 上传照片 保存到本地(防止上传后 又要下载。 上传640 保存 640  320 160 也有可能)
 
 @param image 上传的原图
 @param urlStr 图片路径
 */
- (void)em_saveImage:(UIImage *)image
             withKey:(NSString *)urlStr;

/**
 移除本地缓存的图片

 @param urlKey 缓存key
 */
- (void)em_removeImageForKey:(NSString *)urlKey;

/**
 获取本地缓存的图片
 
 @param imageUrl 图片地址
 @return UIImage
 */
- (UIImage *)em_getCacheImage:(NSString *)imageUrl;

/**
 增加水印

 @param location 未知信息
 @param date 时间信息
 @return 后缀地址
 */
- (NSString *)em_appendlocation:(NSString *)location
                     createDate:(NSString *)date;

@end

@interface UIImageView(FFWebCache)

/**
 UIImageView 直接加载url图片
 
 @param urlStr 图片地址(NSString/NSURL)
 @param placeholder 默认占位图
 */
- (void)em_setImageAtPath:(id)urlStr
              placeholder:(UIImage *)placeholder;

/**
 UIImageView 直接加载url图片(带block)
 
 @param urlStr 图片地址(NSString/NSURL)
 @param placeholder 默认占位图
 @param comBlock 图片下载完成回调
 */
- (void)em_setImageStr:(NSString *)urlStr
           placeholder:(UIImage *)placeholder
             completed:(void (^)(UIImage *image, BOOL finish))comBlock;

/**
 *  下载完成后，缓存 和 显示 fitSize 的image。
 A.网宿来源由网宿裁剪
 B.本地裁剪实现 1、缓存原始图 2、缓存fitSize图 3、获取缓存图 根据 size 取
 *  @param urlStr 图片地址
 *  @param size 显示尺寸
 *  @param placeholder 占位图
 */
- (void)em_setImageStr:(NSString *)urlStr
               fitSize:(CGSize)size
           placeholder:(UIImage *)placeholder;

/**
 七牛来源由七牛裁剪
 
 @param urlStr 图片地址
 @param size 显示尺寸
 @param placeholder 占位图
 */
- (void)em_setImageFromWQiNiu:(NSString *)urlStr
                      fitSize:(CGSize)size
                  placeholder:(UIImage *)placeholder;

/**
 url编码

 @param str url字符串
 @return 编码后的url
 */
- (NSString *)urlEncode:(NSString *)str;

@end
