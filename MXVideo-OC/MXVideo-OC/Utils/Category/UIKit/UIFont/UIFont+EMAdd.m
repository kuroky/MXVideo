//
//  UIFont+EMAdd.m
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "UIFont+EMAdd.h"

@implementation UIFont (EMAdd)

+ (UIFont *)em_boldFont:(CGFloat)size {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.2) {
        UIFont *font = [UIFont systemFontOfSize:size
                                         weight:UIFontWeightMedium];
        return font;
    }
    else {
        UIFont *font = [UIFont boldSystemFontOfSize:size];
        return font;
    }
}

@end
