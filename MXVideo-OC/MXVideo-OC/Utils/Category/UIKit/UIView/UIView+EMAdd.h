//
//  UIView+EMAdd.h
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EMAdd)
#pragma mark - 赋值相关的
/**
 *  frame.origin.x
 */
@property (nonatomic, assign) CGFloat em_x;

/**
 frame.origin.x + frame.size.width
 */
@property (nonatomic, assign) CGFloat em_right;

/**
 *  frame.origin.y
 */
@property (nonatomic, assign) CGFloat em_y;

/**
 frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat em_bottom;

/**
 *  center.x
 */
@property (nonatomic, assign) CGFloat em_centerX;

/**
 *  center.y
 */
@property (nonatomic, assign) CGFloat em_centerY;

/**
 *  frame.size.width
 */
@property (nonatomic, assign) CGFloat em_width;

/**
 *  frame.size.height
 */
@property (nonatomic, assign) CGFloat em_height;

/**
 *  frame.size
 */
@property (nonatomic, assign) CGSize em_size;

/**
 *  frame.origin
 */
@property (nonatomic, assign) CGPoint em_orgin;

/**
 *  self.frame
 */
@property (nonatomic, assign) CGRect em_frame;

/**
 取当前view的父控制器
 */
@property (nullable, nonatomic, readonly) UIViewController *em_viewController;

/**
 Converts a point from the receiver's coordinate system to that of the specified view or window.
 
 @param point A point specified in the local coordinate system (bounds) of the receiver.
 @param view  The view or window into whose coordinate system point is to be converted.
 If view is nil, this method instead converts to window base coordinates.
 @return The point converted to the coordinate system of view.
 */
- (CGPoint)em_convertPoint:(CGPoint)point
            toViewOrWindow:(nullable UIView *)view;

/**
 Converts a point from the coordinate system of a given view or window to that of the receiver.
 
 @param point A point specified in the local coordinate system (bounds) of view.
 @param view  The view or window with point in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The point converted to the local coordinate system (bounds) of the receiver.
 */
- (CGPoint)em_convertPoint:(CGPoint)point
          fromViewOrWindow:(nullable UIView *)view;

/**
 Converts a rectangle from the receiver's coordinate system to that of another view or window.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of the receiver.
 @param view The view or window that is the target of the conversion operation. If view is nil, this method instead converts to window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)em_convertRect:(CGRect)rect
          toViewOrWindow:(nullable UIView *)view;

/**
 Converts a rectangle from the coordinate system of another view or window to that of the receiver.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of view.
 @param view The view or window with rect in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)em_convertRect:(CGRect)rect
        fromViewOrWindow:(nullable UIView *)view;

/**
 移除当前view的子view
 */
- (void)em_removeAllSubviews;

/**
 生成当前view的Image
 */
- (nullable UIImage *)em_snapshotImage;

/**
 Create a snapshot image of the complete view hierarchy.
 @discussion It's faster than "snapshotImage", but may cause screen updates.
 See -[UIView drawViewHierarchyInRect:afterScreenUpdates:] for more information.
 */
- (nullable UIImage *)em_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

/**
 生成当前view的PDF Data
 */
- (nullable NSData *)em_snapshotPDF;

/**
 画圆角
 
 @param corner 局部圆角/全部圆角
 @param radius 圆角半径
 @param bounds view的bounds
 */
- (void)em_drawCorner:(UIRectCorner)corner
           withRadius:(CGFloat)radius
           withBounds:(CGRect)bounds;

/**
 画边框

 @param radius 圆角
 @param bounds view bounds
 @param lineWidth 边框宽度
 @param lineColor 边框颜色
 */
- (void)em_drawBorder:(CGFloat)radius
           withBounds:(CGRect)bounds
            lineWidth:(CGFloat)lineWidth
             lineColor:(nonnull UIColor *)lineColor;

+ (nullable CAShapeLayer *)em_boardLayer:(CGFloat)radius
                              withBounds:(CGRect)bounds
                               lineWidth:(CGFloat)lineWidth
                               lineColor:(nonnull UIColor *)lineColor;


/**
 画投影

 @param color 阴影颜色
 @param radius 阴影半径 (默认3)
 @param offset 阴影偏移量 x向右，y向下 默认(0, -3)
 @param opacity 阴影透明度
 */
- (void)em_drawShadow:(nonnull UIColor *)color
         shadowRadius:(CGFloat)radius
         shadowOffset:(CGSize)offset
        shadowOpacity:(CGFloat)opacity;

/**
 画背景

 @param color 背景色
 @param rect frame
 @param opacity 透明度
 @return CAShapeLayer
 */
+ (nonnull CAShapeLayer *)em_drawBackLayer:(nonnull UIColor *)color
                                  backRect:(CGRect)rect
                              backOpactity:(CGFloat)opacity;

@end
