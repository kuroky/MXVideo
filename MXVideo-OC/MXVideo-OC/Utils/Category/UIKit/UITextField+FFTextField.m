//
//  UITextField+FFTextField.m
//  Funmily
//
//  Created by Kuroky on 16/8/25.
//  Copyright © 2016年 HuuHoo. All rights reserved.
//

#import "UITextField+FFTextField.h"
#import "NSString+EMString.h"

@implementation UITextField (FFTextField)

- (void)em_TFplaceholder:(NSString *)text
               withColor:(UIColor *)color {
    
    NSDictionary *attibute = @{NSForegroundColorAttributeName: color};
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:text attributes:attibute];
    self.attributedPlaceholder = placeholder;
}

@end
