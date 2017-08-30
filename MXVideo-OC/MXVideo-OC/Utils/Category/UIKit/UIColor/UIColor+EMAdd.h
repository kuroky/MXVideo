//
//  UIColor+EMAdd.h
//  Emucoo
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (EMAdd)

/**
 *  返回十六进制字符串颜色对象
 *
 *  @param hexStr 十六进制字符串颜色
 *
 *  @return 十六进制字符串Color
 */
+ (UIColor *)em_colorWithHexString:(NSString *)hexStr;

/**
 *    随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)em_randomColor;

@end
