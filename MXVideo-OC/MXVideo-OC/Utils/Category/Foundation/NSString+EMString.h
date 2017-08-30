//
//  NSString+EMString.h
//  Emucoo
//
//  Created by kuroky on 2017/6/22.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EMString)

#pragma mark - Hash
///=============================================================================
/// @name Hash
///=============================================================================

/**
 *  返回一个MD5字符串
 */
- (nullable NSString *)em_md5String;

/**
 *  返回一个SHA1字符串
 */
- (nullable NSString *)em_sha1String;

/**
 *  返回一个sha512字符串
 */
- (nullable NSString *)em_sha512String;

/**
 *  返回一个用SHA1算法的key转换的NSString hmac。
 *
 *  @param key The hmac key
 *
 *  @return String
 */
- (nullable NSString *)em_hmacSHA1StringWithKey:(nullable NSString *)key;

/**
 *  返回一个用SHA512算法的key转换的NSString hmac。
 *
 *  @param key The hmac key
 *
 *  @return String
 */
- (nullable NSString *)em_hmacSHA512StringWithKey:(nullable NSString *)key;

/**
 * 返回一个crc32 hash.
 */
- (nullable NSString *)em_crc32String;

#pragma mark - Encode and decode
///=============================================================================
/// @name Encode and decode
///=============================================================================

/**
 *  返回NSString base64编码字符串
 */
- (nullable NSString *)em_base64EncodedString;

/**
 *  返回NSString base64编码string 参数：base64EncodedString
 */
+ (nullable NSString *)em_stringWithBase64EncodedString:(nullable NSString *)base64EncodedString;

/**
 *  URL 编码成 utf-8 string.
 *
 *  @return encoded string
 */
- (nullable NSString *)em_stringByURLEncode;

/**
 *  url解码成utf-8字符串
 */
- (nullable NSString *)em_stringByURLDecode;

//Escape commmon HTML to Entity.
// Example: "a<b" will be escape to "a&lt;b".
/**
 *  过滤commmon HTML特殊字符 例：a < b 过滤为"a&lt;b"
 *
 *  @return 过滤之后的字符串
 */
- (nullable NSString *)em_stringByEscapingHTML;

#pragma mark - Regular Expression正则表达式
///=============================================================================
/// @name Regular Expression
///=============================================================================

/**
 *  字符串是否匹配regex
 */
- (BOOL)em_matchesRegex:(nullable NSString *)regex options:(NSRegularExpressionOptions)options;

/**
 *  匹配特定正则表达式 每个对象执行一个给定的regular匹配
 *
 *  @param regex   正则表达式
 *  @param options options
 *  @param block   usingBlock
 */
- (void)em_enumerateRegexMatches:(nullable NSString *)regex
                         options:(NSRegularExpressionOptions)options
                      usingBlock:(nullable void (^)(NSString  * _Null_unspecified match,NSRange matchRange,BOOL *_Null_unspecified stop))block;


/**
 *  返回一个新的匹配regular的字符串 来代替template string
 *
 *  @param regex       正则表达式regular
 *  @param options     options
 *  @param replacement template
 *
 *  @return new string
 */
- (nullable NSString *)em_stringByReplacingRegex:(nullable NSString *)regex
                                         options:(NSRegularExpressionOptions)options
                                      withString:(nullable NSString *)replacement;


#pragma mark - NSNumber Compatible
///=============================================================================
/// @name NSNumber Compatible
///=============================================================================

//字符串转换为NSNumber类型
@property (readonly) char em_charValue;
@property (readonly) unsigned char em_unsignedCharValue;
@property (readonly) short em_shortValue;
@property (readonly) unsigned short em_unsignedShortValue;
@property (readonly) unsigned int em_unsignedIntValue;
@property (readonly) long em_longValue;
@property (readonly) unsigned long em_unsignedLongValue;
@property (readonly) unsigned long long em_unsignedLongLongValue;
@property (readonly) NSUInteger em_unsignedIntegerValue;


#pragma mark - Utilities

/**
 *是否空格换行等字符 ：nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
 */
- (BOOL)em_isNotBlank;

/**
 *  过滤指定的字符串
 *
 *  @param charaters 需要过滤的字符串list
 *
 *  @return NSString
 */
- (nullable NSString *)em_removeCharacters:(nullable NSArray *)charaters;

/**
 *  字符串转换为NSNumber
 */
- (nullable NSNumber *)em_numberValue;

/**
 *返回NSData using UTF-8 encoding.
 */
- (nullable NSData *)em_dataValue;

/**
 *  String转换为json格式  NSString: @"{"name":"a","count":2}"  => NSDictionary: @[@"name":@"a",@"count":@2]
 */
- (nullable id)em_jsonValueDecoded;

/**
 *  file内容（名字是name）转换为string
 */
+ (nullable NSString *)em_stringNamed:(nullable NSString *)name;

/**
 是否是11位数字

 @return YES/NO
 */
- (BOOL)em_isPhoneNumber;

/**
 密码是否符合规则 (6-20个字符，支持数字、大小写字母和标点符号，不允许有空格)

 @return YES/NO
 */
- (BOOL)em_pwdIsLegal;

/**
 真实姓名是否符合规则

 @return YES/NO
 */
- (BOOL)em_realNmaeIsLegal;

/**
 是否百分数

 @return YES/NO
 */
- (BOOL)em_isPercentNumber;

/**
 是否人民币

 @return YES/NO
 */
- (BOOL)em_isRenminbi;

/**
 是否整数

 @return YES/NO
 */
- (BOOL)em_isInteger;

@end
