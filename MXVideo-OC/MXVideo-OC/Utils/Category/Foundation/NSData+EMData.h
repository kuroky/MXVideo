//
//  NSData+EMData.h
//  Emucoo
//
//  Created by kuroky on 2017/6/22.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (EMData)

#pragma mark - Hash
///=============================================================================
/// @name Hash
///=============================================================================

/**
 * 返回一个MD5String
 */
- (nullable NSString *)em_md5String;

/**
 * 返回一个MD5Data
 */
- (nullable NSData *)em_md5Data;

/**
 * 返回一个sha1String
 */
- (nullable NSString *)em_sha1String;

/**
 * 返回一个sha1 hash
 */
- (nullable NSData *)em_sha1Data;

/**
 * 返回一个sha512String
 */
- (nullable NSString *)em_sha512String;

/**
 * 返回一个sha512Data
 */
- (nullable NSData *)em_sha512Data;

/**
 *  返回一个用md5算法的key转换NSString hmac。
 *
 *  @param key The hmac key
 *
 *  @return string
 */
- (nullable NSString *)em_hmacMD5StringWithKey:(nullable NSString *)key;

/**
 *  返回一个用md5算法的key转换NSData hmac。
 *
 *  @param key The hmac key
 *
 *  @return Data
 */
- (nullable NSData *)em_hmacMD5DataWithKey:(nullable NSData *)key;

/**
 *  返回一个用SHA1算法的key转换的NSString hmac。
 *
 *  @param key The hmac key
 *
 *  @return string
 */
- (nullable NSString *)em_hmacSHA1StringWithKey:(nullable NSString *)key;

/**
 *  返回一个用SHA1算法的key转换的NSData hmac。
 *
 *  @param key The hmac key
 *
 *  @return Data
 */
- (nullable NSData *)em_hmacSHA1DataWithKey:(nullable NSData *)key;


/**
 *  返回一个用SHA512算法的key转换的NSString hmac。
 *
 *  @param key The hmac key
 *
 *  @return String
 */
- (nullable NSString *)em_hmacSHA512StringWithKey:(nullable NSString *)key;

/**
 *  返回一个用SHA512算法的key转换的NSData hmac。
 *
 *  @param key The hmac key
 *
 *  @return Data
 */
- (nullable NSData *)em_hmacSHA512DataWithKey:(nullable NSData *)key;

/**
 Returns a lowercase NSString for crc32 hash.
 */
- (nullable NSString *)em_crc32String;

/**
 Returns crc32 hash.
 */
- (uint32_t)em_crc32;

#pragma mark - Encode and decode
///=============================================================================
/// @name Encode and decode
///=============================================================================

/**
 * 返回UTF8字符串.
 */
- (nullable NSString *)em_utf8String;

/**
 *  返回十六进制的字符串
 */
- (nullable NSString *)em_hexString;

/**
 *  十六进制的字符串转换为NSData
 */
+ (nullable NSData *)em_dataWithHexString:(nullable NSString *)hexString;

/**
 *  返回NSString base64编码字符串
 */
- (nullable NSString *)em_base64EncodedString;

/**
 *  返回NSString base64编码NSData 参数：base64EncodedString
 */
+ (nullable NSData *)em_dataWithBase64EncodedString:(nullable NSString *)base64EncodedString;

/**
 *  NSData转换为一个字典或者数组
 *
 *  @return 返回一个字典或者数组
 */
- (nullable id)em_jsonValueDecoded;

#pragma mark - Inflate and deflate 解压和压缩

/**
 *  gzip data 解压为普通的NSData
 */
- (nullable NSData *)em_gzipInflate;

/**
 *   普通的NSData压缩为 gzip data
 */
- (nullable NSData *)em_gzipDeflate;


#pragma mark - Others

/**
 *  用name的一个file生成一个Data
 *
 *  @param name name
 *
 *  @return Data
 */
+ (nullable NSData *)em_dataNamed:(nullable NSString *)name;

@end
