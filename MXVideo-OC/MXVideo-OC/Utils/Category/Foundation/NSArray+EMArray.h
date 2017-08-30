//
//  NSArray+EMArray.h
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (EMArray)

/**
 *  创建并从指定的属性列表数据返回一个数组
 */
+ (nullable NSArray *)arrayWithPlistData:(nullable NSData *)plist;

/**
 *  创建并返回从指定属性列表XML字符串数组。
 */
+ (nullable NSArray *)arrayWithPlistString:(nullable NSString *)plist;

/**
 *  序列化数组二进制属性列表数据。
 */
- (nullable NSData *)plistData;

/**
 *  序列化数组到XML属性列表字符串。
 */
- (nullable NSString *)plistString;

/**
 *  转换对象JSON字符串。
 */
- (nullable NSString *)jsonStringEncoded;

/**
 *  转换对象格式的JSON字符串。
 */
- (nullable NSString *)jsonPrettyStringEncoded;
@end


/**
 Provide some some common method for `NSMutableArray`.
 */
@interface NSMutableArray (EMArray)

/**
 *  创建并从指定的属性列表数据返回一个可变数组
 */
+ (nullable NSMutableArray *)arrayWithPlistData:(nullable NSData *)plist;

/**
 *  创建并返回从指定属性列表XML字符串可变数组。
 */
+ (nullable NSMutableArray *)arrayWithPlistString:(nullable NSString *)plist;

@end
