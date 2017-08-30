//
//  UITextField+FFTextField.h
//  Funmily
//
//  Created by Kuroky on 16/8/25.
//  Copyright © 2016年 HuuHoo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^blockss)(NSInteger lenght);

@interface UITextField (FFTextField)

/**
 *  给UITextField 自定义placeholder
 *
 *  @param text  placeholder
 *  @param color color
 *
 */
- (void)em_TFplaceholder:(NSString *)text
               withColor:(UIColor *)color;

@end
