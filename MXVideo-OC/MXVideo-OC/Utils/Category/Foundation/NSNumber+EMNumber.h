//
//  NSNumber+EMNumber.h
//  Emucoo
//
//  Created by kuroky on 2017/6/22.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (EMNumber)

/**
 *  string转换为NSNumber
 *
 *  @param string @"12", @"12.345", @" -0xFF", @" .23e99 "...
 *
 *  @return NSNumber
 */
+ (nullable NSNumber *)em_numberWithString:(nullable NSString *)string;

@end
