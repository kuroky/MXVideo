//
//  UIBarButtonItem+EMAdd.h
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (EMAdd)

/**
 *  添加导航栏上的item按钮
 *
 *  @param target   当前调用此方法的对象
 *  @param action   选择器方法
 *  @param image    正常状态下的按钮状态
 *
 *  @return 返会这个item按钮
 */
+ (UIButton *)itemWithTarget:(id)target
                      action:(SEL)action
                   imageName:(NSString *)image;

/**
 创建导航栏上的item按钮

 @param title title
 @param color 未选中颜色
 @param hightColor 选中颜色
 @param target 响应方
 @param action 响应方法
 @return UIButton
 */
+ (UIButton *)itemWithTitle:(NSString *)title
                 titleColor:(UIColor *)color
                 hightColor:(UIColor *)hightColor
                    leftBar:(BOOL)left
                     target:(id)target
                     action:(SEL)action;

@end
