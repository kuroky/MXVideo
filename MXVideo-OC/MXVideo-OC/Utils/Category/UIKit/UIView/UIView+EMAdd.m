//
//  UIView+EMAdd.m
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "UIView+EMAdd.h"

@implementation UIView (EMAdd)

#pragma mark- 赋值相关的
- (void)setEm_x:(CGFloat)em_x {
    CGRect frame = self.frame;
    frame.origin.x = em_x;
    self.frame = frame;
}

- (CGFloat)em_x {
    return self.frame.origin.x;
}

- (void)setEm_right:(CGFloat)ff_right {
    CGRect frame = self.frame;
    frame.origin.x = ff_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)em_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setEm_centerX:(CGFloat)em_centerX {
    CGPoint center = self.center;
    center.x = em_centerX;
    self.center = center;
}

- (CGFloat)em_centerX {
    return self.center.x;
}

- (void)setEm_y:(CGFloat)em_y {
    CGRect frame = self.frame;
    frame.origin.y = em_y;
    self.frame = frame;
}

- (CGFloat)em_y {
    return self.frame.origin.y;
}

- (void)setEm_bottom:(CGFloat)ff_bottom {
    CGRect frame = self.frame;
    frame.origin.y = ff_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)em_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setEm_centerY:(CGFloat)em_centerY {
    CGPoint center = self.center;
    center.y = em_centerY;
    self.center = center;
}

- (CGFloat)em_centerY {
    return self.center.y;
}

- (void)setEm_width:(CGFloat)em_width {
    CGRect frame = self.frame;
    frame.size.width = em_width;
    self.frame = frame;
}

- (CGFloat)em_width {
    return self.frame.size.width;
}

- (void)setEm_height:(CGFloat)em_height {
    CGRect frame = self.frame;
    frame.size.height = em_height;
    self.frame = frame;
}

- (CGFloat)em_height {
    return self.frame.size.height;
}

- (void)setEm_size:(CGSize)em_size {
    CGRect frame = self.frame;
    frame.size = em_size;
    self.frame = frame;
}

- (CGSize)em_size {
    return self.frame.size;
}

- (void)setEm_orgin:(CGPoint)em_orgin {
    CGRect frame = self.frame;
    frame.origin = em_orgin;
    self.frame = frame;
}

- (CGPoint)em_orgin {
    return self.frame.origin;
}

- (void)setEm_frame:(CGRect)em_frame{
    CGRect frame = self.frame;
    frame = em_frame;
    self.frame = frame;
}

- (CGRect)em_frame{
    return self.frame;
}

#pragma mark - 取当前view的父控制器
- (UIViewController *)em_viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - 转换坐标系相关的方法
- (CGPoint)em_convertPoint:(CGPoint)point
            toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point toWindow:nil];
        } else {
            return [self convertPoint:point toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point toView:view];
    point = [self convertPoint:point toView:from];
    point = [to convertPoint:point fromWindow:from];
    point = [view convertPoint:point fromView:to];
    return point;
}

- (CGPoint)em_convertPoint:(CGPoint)point
          fromViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point fromWindow:nil];
        } else {
            return [self convertPoint:point fromView:nil];
        }
    }
    
    UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow *to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point fromView:view];
    point = [from convertPoint:point fromView:view];
    point = [to convertPoint:point fromWindow:from];
    point = [self convertPoint:point fromView:to];
    return point;
}

- (CGRect)em_convertRect:(CGRect)rect
          toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect toWindow:nil];
        } else {
            return [self convertRect:rect toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if (!from || !to) return [self convertRect:rect toView:view];
    if (from == to) return [self convertRect:rect toView:view];
    rect = [self convertRect:rect toView:from];
    rect = [to convertRect:rect fromWindow:from];
    rect = [view convertRect:rect fromView:to];
    return rect;
}

- (CGRect)em_convertRect:(CGRect)rect
        fromViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect fromWindow:nil];
        } else {
            return [self convertRect:rect fromView:nil];
        }
    }
    
    UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow *to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertRect:rect fromView:view];
    rect = [from convertRect:rect fromView:view];
    rect = [to convertRect:rect fromWindow:from];
    rect = [self convertRect:rect fromView:to];
    return rect;
}

#pragma mark - 移除当前view的子view
- (void)em_removeAllSubviews {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

#pragma mark - 生成当前view的Image
- (UIImage *)em_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)em_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (NSData *)em_snapshotPDF {
    CGRect bounds = self.bounds;
    NSMutableData* data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

#pragma mark - 画出指定的圆角
- (void)em_drawCorner:(UIRectCorner)corner
           withRadius:(CGFloat)radius
           withBounds:(CGRect)bounds {
    CGSize size = CGSizeMake(radius, radius);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds
                                               byRoundingCorners:corner
                                                     cornerRadii:size];
    CAShapeLayer *masklayer = [CAShapeLayer new];
    masklayer.frame = bounds;
    masklayer.path = path.CGPath;
    self.layer.mask = masklayer;
}

- (void)em_drawBorder:(CGFloat)radius
           withBounds:(CGRect)bounds
            lineWidth:(CGFloat)lineWidth
             lineColor:(UIColor *)lineColor {
    CGSize size = CGSizeMake(radius, radius);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds
                                               byRoundingCorners:UIRectCornerAllCorners
                                                     cornerRadii:size];
    CAShapeLayer *masklayer = [CAShapeLayer new];
    masklayer.path = path.CGPath;
    masklayer.lineWidth = lineWidth;
    masklayer.strokeColor = lineColor.CGColor;
    masklayer.fillColor = [[UIColor clearColor] CGColor];
    [self.layer addSublayer:masklayer];
    //self.layer.mask = masklayer;
}

+ (nullable CAShapeLayer *)em_boardLayer:(CGFloat)radius
                              withBounds:(CGRect)bounds
                               lineWidth:(CGFloat)lineWidth
                               lineColor:(nonnull UIColor *)lineColor {
    CGSize size = CGSizeMake(radius, radius);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds
                                               byRoundingCorners:UIRectCornerAllCorners
                                                     cornerRadii:size];
    CAShapeLayer *masklayer = [CAShapeLayer new];
    masklayer.path = path.CGPath;
    masklayer.lineWidth = lineWidth;
    masklayer.strokeColor = lineColor.CGColor;
    masklayer.fillColor = [[UIColor clearColor] CGColor];
    return masklayer;
}

- (void)em_drawShadow:(nonnull UIColor *)color
         shadowRadius:(CGFloat)radius
         shadowOffset:(CGSize)offset
        shadowOpacity:(CGFloat)opacity {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
}

+ (nonnull CAShapeLayer *)em_drawBackLayer:(nonnull UIColor *)color
                                  backRect:(CGRect)rect
                              backOpactity:(CGFloat)opacity {
    UIBezierPath *bezi = [UIBezierPath bezierPathWithRect:rect];
    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.path = bezi.CGPath;
    backLayer.opacity = opacity;
    backLayer.strokeColor = [[UIColor clearColor] CGColor];
    backLayer.fillColor = [color CGColor];
    return backLayer;
}

@end
