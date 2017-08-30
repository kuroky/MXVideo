//
//  EMCache.m
//  Emucoo
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMCache.h"
#import "MXFileManager.h"
#import "YYCache.h"

static NSString *const kEMCahceName =   @"EmucooCache";

@interface EMCache ()

@property (nonatomic, strong) YYCache *yyCache;

@end

@implementation EMCache

+ (instancetype)sharedCache {
    static EMCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [EMCache new];
    });
    return cache;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [[MXFileManager sharedManager] mx_createDirectiory:kEMCahceName
                                           isTemporary:NO
                                         shouldStorage:YES
                                            completion:nil];
    NSString *filePath = [[MXFileManager sharedManager].userCachePath stringByAppendingPathComponent:kEMCahceName];
    self.yyCache = [[YYCache alloc] initWithPath:filePath];
}

#pragma mark - 读取缓存
- (nullable id<NSCoding>)em_objectForKey:(NSString *)key {
    return [_yyCache objectForKey:key];
}

#pragma mark - 数据缓存
- (void)em_setObject:(_Nonnull id<NSCoding>)object
              ForKey:(NSString *)key {
    [_yyCache setObject:object forKey:key];
}

#pragma mark - 判断缓存是否存在
- (BOOL)em_containsObjectForKey:(NSString *)key {
    return [_yyCache containsObjectForKey:key];
}

#pragma mark - 删除指定缓存
- (void)em_removeObjectForKey:(NSString *)key {
    [_yyCache removeObjectForKey:key];
}

#pragma mark - 异步读取磁盘缓存
- (void)em_objectForKey:(NSString *)key
              withBlock:(void (^)(id<NSCoding> _Nonnull object))block {
    [_yyCache.diskCache objectForKey:key
                           withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
                               if (block) {
                                   dispatch_async(dispatch_get_main_queue(), ^{
                                       block(object);
                                   });
                               }
                           }];
}

#pragma mark - 异步数据缓存到磁盘
- (void)em_setObject:(_Nonnull id<NSCoding>)object
              ForKey:(NSString *)key
           withBlock:(void (^)(BOOL finish))block {
    [_yyCache.diskCache setObject:object
                           forKey:key
                        withBlock:^{
                            if (block) {
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    block(YES);
                                });
                            }
                        }];
}

#pragma mark - 异步判断磁盘缓存是否存在
- (void)em_containsObjectForKey:(NSString *)key
                      withBlock:(void (^)(BOOL contains))block {
    [_yyCache.diskCache containsObjectForKey:key
                                   withBlock:^(NSString * _Nonnull key, BOOL contains) {
                                       if (block) {
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               block(contains);
                                           });
                                       }
                                   }];
}

#pragma mark - 异步删除磁盘缓存
- (void)em_removeObjectForKey:(NSString *)key
                    withBlock:(void (^)(BOOL finish))block {
    [_yyCache.diskCache removeObjectForKey:key
                                 withBlock:^(NSString * _Nonnull key) {
                                     if (block) {
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             block(YES);
                                         });
                                     }
                                 }];
}

@end
