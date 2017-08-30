//
//  EMImageCache.m
//  Emucoo
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMImageCache.h"
#import "UIImageView+WebCache.h"
#import "UIImage+EMAdd.h"
#import "NSString+EMString.h"

@interface EMImageCache ()

@end

@implementation EMImageCache

+ (instancetype)sharedCache {
    static EMImageCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [EMImageCache new];
    });
    return cache;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - 清理 SDWebImageManager的缓存
- (void)em_clearCacheCompletion:(void (^)(BOOL completion))completion {
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        completion(YES);
    }];
}

#pragma mark - SDWebImageManager缓存大小
- (NSUInteger)em_getCacheSize {
    return  [SDImageCache sharedImageCache].getSize;
}

#pragma mark - 图片保存到本地
- (void)em_saveImage:(UIImage *)image
             withKey:(NSString *)urlStr {
    if (!urlStr || !image) {
        return;
    }
    
    [[SDImageCache sharedImageCache] storeImage:image
                                         forKey:urlStr
                                     completion:nil];
}

- (void)em_removeImageForKey:(NSString *)urlKey {
    if (!urlKey.length) {
        return;
    }
    
    [[SDImageCache sharedImageCache] removeImageForKey:urlKey
                                              fromDisk:YES
                                        withCompletion:nil];
}

#pragma mark - 获取本地缓存的图片
- (UIImage *)em_getCacheImage:(NSString *)imageUrl {
    if (!imageUrl) {
        return nil;
    }
    
    ;
    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromCacheForKey:imageUrl];
    return cacheImage;
}

#pragma mark - 水印处理
- (NSString *)em_appendlocation:(NSString *)location
                     createDate:(NSString *)date {
    if (location.length) {
        NSString *str1 = @"?watermark/3/image/aHR0cDovL29zam1xMGczdS5ia3QuY2xvdWRkbi5jb20vbG9jYXRpb25AMngucG5n/dissolve/100/gravity/NorthWest/dx/15/dy/41";
        NSString *str2 = [NSString stringWithFormat:@"/text/%@/font/5b6u6L2v6ZuF6buR/fontsize/400/fill/I0ZGRkZGRg==/dissolve/100/gravity/NorthWest/dx/45/dy/41", [location em_base64EncodedString]];
        NSString *str3 = [NSString stringWithFormat:@"/text/%@/font/5b6u6L2v6ZuF6buR/fontsize/400/fill/I0ZGRkZGRg==/dissolve/100/gravity/NorthEast/dx/15/dy/41|imageslim", [date em_base64EncodedString]];
        NSString *str = [NSString stringWithFormat:@"%@%@%@", str1, str2, str3];
        return [[UIImageView new] urlEncode:str];
    }
    else {
        NSString *str = [NSString stringWithFormat:@"imageView2/0/q/75|watermark/2/text/%@/font/5b6u6L2v6ZuF6buR/fontsize/300/fill/I0ZGRkZGRg==/dissolve/100/gravity/NorthEast/dx/15/dy/41|imageslim", [date em_base64EncodedString]];
        return [[UIImageView new] urlEncode:str];
    }
}

@end

@implementation UIImageView(FFWebCache)

#pragma mark - 直接加载url图片
- (void)em_setImageAtPath:(id)urlStr
              placeholder:(UIImage *)placeholder {
    if ([urlStr isKindOfClass:[NSURL class]]) {
        [self setImageURL:(NSURL*)urlStr placeholder:placeholder];
        return;
    }
    if (![urlStr isKindOfClass:[NSString class]]) {
        self.image = placeholder;
        return;
    }
    NSString *str = [self urlEncode:urlStr];
    [self setImageURL:[NSURL URLWithString:str] placeholder:placeholder];
}

- (void)setImageURL:(NSURL *)url
        placeholder:(UIImage *)placeholder {
    //    [self setShowActivityIndicatorView:YES];
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:SDWebImageRetryFailed | SDWebImageLowPriority];
}

#pragma mark - 直接加载url图片(带block)
- (void)em_setImageStr:(NSString *)urlStr
           placeholder:(UIImage *)placeholder
             completed:(void (^)(UIImage *image, BOOL finish))comBlock {
    if (!urlStr) {
        if(comBlock) {
            comBlock(nil, YES);
        }
        return;
    }
    
    NSURL *url = [NSURL URLWithString:[self urlEncode:urlStr]];
    //    [self setShowActivityIndicatorView:YES];
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if(comBlock) {
                           comBlock(image, YES);
                       }
                   }];
}

#pragma mark - 加载指定size图片
- (void)em_setImageStr:(NSString *)urlStr
               fitSize:(CGSize)size
           placeholder:(UIImage *)placeholder {
    if (!urlStr) {
        self.image = placeholder;
        return;
    }
    urlStr = [self urlEncode:urlStr];
    NSString *sizeImagekey = [self cropFromPath:urlStr cropSize:size];
    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromCacheForKey:sizeImagekey];
    if (cacheImage) {
        self.image = cacheImage;
        [self setNeedsLayout];
        return;
    }
    
    __weak __typeof(self)wself = self;
    NSURL *url = [NSURL URLWithString:urlStr];
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:SDWebImageRetryFailed | SDWebImageLowPriority | SDWebImageAvoidAutoSetImage
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (!wself) {
                           return;
                       }
                       if (image) {
                           [wself cropDownloadImage:image
                                         expectSize:size
                                            saveKey:sizeImagekey];
                           [[SDImageCache sharedImageCache] removeImageForKey:imageURL.absoluteString fromDisk:NO withCompletion:nil];
                       }
                       else {
                           wself.image = placeholder;
                           [wself setNeedsLayout];
                       }
                   }];
}

#pragma mark - 七牛来源裁剪
- (void)em_setImageFromWQiNiu:(NSString *)urlStr
                      fitSize:(CGSize)size
                  placeholder:(UIImage *)placeholder {
    if (!urlStr) {
        self.image = placeholder;
        return;
    }
    NSString *sizeImagekey = [self appenQiNiuPath:urlStr cropSize:size];
    NSURL *url = [NSURL URLWithString:[self urlEncode:sizeImagekey]];
    
    UIImage *cacheImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:url.absoluteString];
    if (cacheImage) {
        self.image = cacheImage;
        [self setNeedsLayout];
        return;
    }
    
    __weak __typeof(self)wself = self;
    
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:SDWebImageRetryFailed | SDWebImageLowPriority | SDWebImageAvoidAutoSetImage
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (!wself) {
                           return;
                       }
                       if (image) {
                           [wself cropDownloadImage:image
                                         expectSize:size
                                            saveKey:url.absoluteString];
                           [[SDImageCache sharedImageCache] removeImageForKey:url.absoluteString fromDisk:NO withCompletion:nil];
                       }
                       else {
                           wself.image = placeholder;
                           [wself setNeedsLayout];
                       }
                   }];
}

//网宿地址处理(居中裁切)
- (NSString *)appenQiNiuPath:(NSString *)path
                    cropSize:(CGSize)size {
    CGFloat width = size.width * [UIScreen mainScreen].scale;
    CGFloat height = size.height * [UIScreen mainScreen].scale;
    NSString *thumbnail = [NSString stringWithFormat:@"?imageMogr2/auto-orient/thumbnail/!%.fx%.fr/blur/1x0/quality/75|imageslim", width, height];
    NSString *str = [path stringByAppendingString:thumbnail];
    return str;
}

// 本地裁切后的地址
- (NSString *)cropFromPath:(NSString *)path
                  cropSize:(CGSize)size {
    NSString *sizeStr = [NSString stringWithFormat:@"_%.0f_%.0f",size.width,size.height];
    NSString *pathStr = [[path stringByDeletingPathExtension] stringByAppendingString:sizeStr];
    NSString *extensionStr = [path pathExtension];
    NSString *str = @"";
    if (extensionStr) {
        str = [pathStr stringByAppendingPathExtension:extensionStr];
    }
    else {
        str = pathStr;
    }
    return str;
}

// 本地裁切后图片
- (void)cropDownloadImage:(UIImage *)originImage
               expectSize:(CGSize)size
                  saveKey:(NSString *)key {
    UIImage *resizeImage = [originImage em_imageByResizeToSize:size contentMode:UIViewContentModeScaleAspectFill];
    [[SDWebImageManager sharedManager] saveImageToCache:resizeImage
                                                 forURL:[NSURL URLWithString:key]];
    self.image = resizeImage;
    [self setNeedsLayout];
}

#pragma mark - Url Encode
- (NSString *)urlEncode:(NSString *)str {
    NSCharacterSet *charSet = [NSCharacterSet URLFragmentAllowedCharacterSet];
    //"#%<>[\]^`{|}
    NSString *newString = [str stringByAddingPercentEncodingWithAllowedCharacters:charSet];
    if (newString) {
        return newString;
    }
    return str;
}

@end
