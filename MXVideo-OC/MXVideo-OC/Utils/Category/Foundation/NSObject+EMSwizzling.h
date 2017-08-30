//
//  NSObject+EMSwizzling.h
//  Emucoo
//
//  Created by kuroky on 2017/6/22.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EMSwizzling)

#pragma mark - Swap method (Swizzling)
///=============================================================================
/// @name Swap method (Swizzling)
///=============================================================================

/**
 *  交换两个实例在一个类方法的实现
 *
 *  @param originalSel 原来的方法
 *  @param newSel      新的方法
 *
 *  @return 交换是否成功
 */

+ (BOOL)swizzleInstanceMethod:(nullable SEL)originalSel with:(nullable SEL)newSel;

/**
 *  交换两个类一个类方法的实现
 *
 *  @param originalSel 原来的类方法
 *  @param newSel      新的类方法
 *
 *  @return 是否成功
 */
+ (BOOL)swizzleClassMethod:(nullable SEL)originalSel with:(nullable SEL)newSel;

#pragma mark - Others
///=============================================================================
/// @name Others
///=============================================================================

/**
 *  返回类名字
 */
+ (nullable NSString *)className;

/**
 *  返回类名字
 */
- (nullable NSString *)className;

@end
