//
//  EMProgressHUD.m
//  Emucoo
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMProgressHUD.h"
#import "MBProgressHUD.h"
#import "SDWebImageCompat.h"
#import "UIColor+EMAdd.h"

static CGFloat const kDefaultToastOffSetY       =   200;    // 默认y轴: >0中心点以下, <0中心点以上
static CGFloat const kDefaultToastHideDelay     =   2.0;    //  默认2s后消失

@interface EMProgressHUD () <MBProgressHUDDelegate> {
    
    MBProgressHUD *_mbProgressHUD;
    MBProgressHUD *_toastHUD;
    // MBProgressHUD *_alwaysToastHUD;
    
    MBProgressHUD *_progressBarHUD;
    
    BOOL _keyboardIsVisible; // 当前键盘显示状态
    NSMutableArray *_middleToastArray;
}

@end

@implementation EMProgressHUD

+ (instancetype)sharedHUD {
    static EMProgressHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [EMProgressHUD new];
    });
    
    return hud;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - KeyBoadr NSNotification
- (void)setup {
    NSNotificationCenter *notifiationCenter = [NSNotificationCenter defaultCenter];
    [notifiationCenter addObserver:self
                          selector:@selector(keyboardDidShow)
                              name:UIKeyboardDidShowNotification
                            object:nil];
    [notifiationCenter addObserver:self
                          selector:@selector(keyboardDidHide)
                              name:UIKeyboardWillHideNotification
                            object:nil];
    _keyboardIsVisible = NO;
    _middleToastArray = [NSMutableArray arrayWithCapacity:1];
}

- (void)keyboardDidShow {
    _keyboardIsVisible = YES;
}

- (void)keyboardDidHide {
    _keyboardIsVisible = NO;
}

#pragma mark - 显示简单的HUD
- (void)showHUDWithTitle:(NSString *)title
          holdMainThread:(BOOL)hold {
    if (_mbProgressHUD) {
        [self hideHUD];
    }
    
    UIView *pView = [self em_rootWindow];
    dispatch_main_async_safe(^{
        _mbProgressHUD = [MBProgressHUD showHUDAddedTo:pView
                                              animated:YES];
    });
    
    _mbProgressHUD.contentColor = [UIColor whiteColor];
    _mbProgressHUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _mbProgressHUD.bezelView.backgroundColor = [[UIColor em_colorWithHexString:@"010101"] colorWithAlphaComponent:0.7f];
    _mbProgressHUD.label.text = title;
    if (hold) {
        _mbProgressHUD.userInteractionEnabled = YES;
    }
    else {
        _mbProgressHUD.userInteractionEnabled = NO;
    }
}

#pragma mark - 隐藏HUD
- (void)hideHUD {
    dispatch_main_async_safe(^{
        [_mbProgressHUD hideAnimated:YES];
    });
    _mbProgressHUD = nil;
    //[_alwaysToastHUD hideAnimated:YES];
    //_alwaysToastHUD = nil;
}

#pragma mark - 显示有title的HUD
- (void)toastTitle:(NSString *)title {
    if (!title.length) {
        return;
    }

    UIView *pView = [self em_rootWindow];
    if(!pView) {
        return;
    }
    
    [self hideHUD];
    
    if (_toastHUD) {
        dispatch_main_async_safe(^{
            [_toastHUD hideAnimated:YES];
        });
    }
    _toastHUD = nil;
    
    _toastHUD = [self createToastHUD:pView hideDelay:kDefaultToastHideDelay];
    if (!_keyboardIsVisible) {
        _toastHUD.offset = CGPointMake(0.f, kDefaultToastOffSetY);
    }
    _toastHUD.detailsLabel.text = title;
}

#pragma mark - 显示一直的toast
- (void)em_toastAlwaysTitle:(NSString *)title {
    if (!title.length) {
        return;
    }
    
    //if (_alwaysToastHUD) {
    //    [_alwaysToastHUD hideAnimated:YES];
    //    _alwaysToastHUD = nil;
    //}
    
    UIView *pView = [self em_rootWindow];
    if(!pView) {
        return;
    }
    [self hideHUD];
    //_alwaysToastHUD = [self createToastHUD:pView hideDelay:MAXFLOAT];
    //_alwaysToastHUD.detailsLabel.text = title;
}

- (UIWindow *)em_rootWindow {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    return window;
}

- (MBProgressHUD *)createToastHUD:(UIView *)pView
                        hideDelay:(CGFloat)delay {
    __block MBProgressHUD *hud;
    dispatch_main_async_safe(^{
        hud = [MBProgressHUD showHUDAddedTo:pView animated:YES];
    });
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.userInteractionEnabled = NO;
    hud.bezelView.backgroundColor = [[UIColor em_colorWithHexString:@"010101"] colorWithAlphaComponent:0.7f];
    [hud hideAnimated:YES afterDelay:delay];
    return hud;
}

#pragma mark - 返回一个带标题的alertController
- (UIAlertController *)showAlertTitle:(NSString *)title
                           withButton:(NSString *)buttonTitle {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    if (!buttonTitle) {
        buttonTitle = @"好的";
    }
    UIAlertAction *action = [UIAlertAction actionWithTitle:buttonTitle
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alertController addAction:action];
    return alertController;
}

#pragma mark - 带有相应事件的alertController
- (UIAlertController *)showAlertWithTitle:(NSString *)title
                                  message:(NSString *)message
                        cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitle:(NSString *)otherButtonTitle
                            actionHandler:(void(^)(UIAlertAction *action))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancelButtonTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           handler(action);
                                                       }];
        [alertController addAction:action];
    }
    
    if (otherButtonTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:otherButtonTitle
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           handler(action);
                                                       }];
        [alertController addAction:action];
    }
    
    return alertController;
}

#pragma mark - 带有相应事件的ActionSheet
- (UIAlertController *)showActionSheetWithTitle:(NSString *)title
                                        message:(NSString *)message
                              cancelButtonTitle:(NSString *)cancelButtonTitle
                         destructiveButtonTitle:(NSString *)destructiveButtonTitle
                                  actionHandler:(void(^)(UIAlertAction *action))handler
                              otherButtonTitles:(NSString *)otherButtonTitles, ... {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (cancelButtonTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           handler(action);
                                                       }];
        [alertController addAction:action];
    }
    
    if (destructiveButtonTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:destructiveButtonTitle
                                                         style:UIAlertActionStyleDestructive
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           handler(action);
                                                       }];
        [alertController addAction:action];
    }
    
    va_list args;
    va_start(args, otherButtonTitles);
    for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*)) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:arg
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           handler(action);
                                                       }];
        [alertController addAction:action];
    }
    va_end(args);
    
    return alertController;
}

- (void)showHUDWithProgress:(CGFloat)pro {
    UIView *pView = [self em_rootWindow];
    if (!_progressBarHUD) {
        _progressBarHUD = [[MBProgressHUD alloc] initWithView:pView];
        _progressBarHUD.removeFromSuperViewOnHide = YES;
        _progressBarHUD.contentColor = [UIColor whiteColor];
        _progressBarHUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        _progressBarHUD.bezelView.backgroundColor = [[UIColor em_colorWithHexString:@"010101"] colorWithAlphaComponent:0.7f];
        _progressBarHUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
    }
    
    dispatch_main_async_safe(^{
        if (!_progressBarHUD.superview) {
            [pView addSubview:_progressBarHUD];
            [_progressBarHUD showAnimated:YES];
        }
        _progressBarHUD.progress = pro;
    });
}

- (void)hideHUDWithProgress {
    dispatch_main_async_safe(^{
        [_progressBarHUD hideAnimated:YES];
    });
}

@end
