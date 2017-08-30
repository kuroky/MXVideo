//
//  NSDictionary+EMDictionary.h
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (EMDictionary)

#pragma mark - Dictionary Convertor
///=============================================================================
/// @name Dictionary Convertor
///=============================================================================

/**
 *  创建并返回一个指定的属性列表数据字典
 *
 *  @param plist list数据的根对象是字典
 *
 *  @return 字典
 */
+ (nullable NSDictionary *)em_dictionaryWithPlistData:(nullable NSData *)plist;

/**
 *  创建并返回一个指定的属性列表的xml字符串。
 *
 *  @param plist list xml string(根对象是字典)
 *
 *  @return 字典
 */
+ (nullable NSDictionary *)em_dictionaryWithPlistString:(nullable NSString *)plist;

/**
 *  序列化的二进制属性列表数据字典。
 */
- (nullable NSData *)em_plistData;

/**
 * 序列化xml属性列表字符串的字典。
 */
- (nullable NSString *)em_plistString;

/**
 *  字典转换为json字符串
 */
- (nullable NSString *)em_jsonStringEncoded;

/**
 *  字典转换为json字符串格式化
 */
- (nullable NSString *)em_jsonPrettyStringEncoded;

/**
 *  解析XML并包装成一个字典。
 *
 *  @param xmlDataOrString xmlDataOrString
 */
+ (nullable NSDictionary *)em_dictionaryWithXML:(nullable id)xmlDataOrString;

@end


/**
 Provide some some common method for `NSMutableDictionary`.
 */
@interface NSMutableDictionary (EMDictionary)

/**
 *  创建并返回一个指定的属性列表数据字典
 *
 *  @param plist list数据的根对象是字典
 *
 *  @return 字典
 */
+ (nullable NSMutableDictionary *)em_dictionaryWithPlistData:(nullable NSData *)plist;

/**
 *  创建并返回一个指定的属性列表的xml字符串。
 *
 *  @param plist list xml string(根对象是字典)
 *
 *  @return 字典
 */
+ (nullable NSMutableDictionary *)em_dictionaryWithPlistString:(nullable NSString *)plist;

@end
