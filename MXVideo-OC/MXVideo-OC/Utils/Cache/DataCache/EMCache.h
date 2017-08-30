//
//  EMCache.h
//  Emucoo
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMCache : NSObject

+ (_Nullable instancetype)sharedCache;

#pragma mark - 小数据同步

/**
 读取当前key的缓存
 
 @param key 缓存的key
 @return 缓存值
 */
- (_Nullable id<NSCoding>)em_objectForKey:(NSString *_Nonnull)key;

/**
 小数据缓存 同步 (内存和磁盘)

 @param object 需要保存的数据(需实现NSCoding协议)
 @param key 缓存的key
 */
- (void)em_setObject:(_Nonnull id<NSCoding>)object
              ForKey:(NSString *_Nonnull)key;

/**
 当前key的缓存是否存在

 @param key 缓存的key
 @return BOOL
 */
- (BOOL)em_containsObjectForKey:(NSString * _Nonnull)key;

/**
 删除指定key的缓存
 
 @param key 缓存的key
 */
- (void)em_removeObjectForKey:(NSString * _Nonnull)key;

#pragma mark 大数据异步

/**
 读取磁盘缓存 异步

 @param key 缓存的key
 @param block blcok
 */
- (void)em_objectForKey:(NSString *_Nonnull)key
              withBlock:(void (^_Nullable)(id<NSCoding> _Nonnull object))block;

/**
 插入数据

 @param object 缓存数据到磁盘
 @param key 缓存的key
 @param block block
 */
- (void)em_setObject:(_Nonnull id<NSCoding>)object
              ForKey:(NSString *_Nonnull)key
           withBlock:(void (^_Nullable)(BOOL finish))block;

/**
 判断磁盘缓存是否存在

 @param key 缓存的key
 @param block block
 */
- (void)em_containsObjectForKey:(NSString *_Nonnull)key
                      withBlock:(void (^_Nullable)(BOOL contains))block;

/**
 异步删除指定key的磁盘缓存
 
 @param key 缓存的key
 */
- (void)em_removeObjectForKey:(NSString * _Nonnull)key
                    withBlock:(void (^_Nullable)(BOOL finish))block;

@end
