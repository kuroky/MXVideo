//
//  UIBarButtonItem+EMAdd.m
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "UIBarButtonItem+EMAdd.h"
#import "UIView+EMAdd.h"

@implementation UIBarButtonItem (EMAdd)

+ (UIButton *)itemWithTarget:(id)target
                      action:(SEL)action
                   imageName:(NSString *)image {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *bImage = [UIImage imageNamed:image];
    [button setImage:bImage forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.em_size = button.currentImage.size;
    return button;
}

+ (UIButton *)itemWithTitle:(NSString *)title
                 titleColor:(UIColor *)color
                 hightColor:(UIColor *)hightColor
                    leftBar:(BOOL)left
                     target:(id)target
                     action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.em_size = CGSizeMake(44, 44);
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:hightColor forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    if (left) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    else {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
