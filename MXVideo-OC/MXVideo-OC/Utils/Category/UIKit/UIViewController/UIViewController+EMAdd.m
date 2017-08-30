//
//  UIViewController+EMAdd.m
//  Emucoo
//
//  Created by kuroky on 2017/7/18.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "UIViewController+EMAdd.h"
#import <objc/runtime.h>

@implementation UIViewController (EMAdd)

- (BOOL)em_interactivePopDisabled {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setEm_interactivePopDisabled:(BOOL)disabled {
    objc_setAssociatedObject(self, @selector(em_interactivePopDisabled), @(disabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
