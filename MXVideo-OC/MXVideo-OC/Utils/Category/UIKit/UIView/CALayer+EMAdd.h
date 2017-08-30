//
//  CALayer+EMAdd.h
//  Emucoo
//
//  Created by kuroky on 2017/7/15.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/QuartzCore.h>

@interface CALayer (EMAdd)

/**
 Take snapshot without transform, image's size equals to bounds.
 */
- (UIImage *)snapshotImage;

/**
 Take snapshot without transform, PDF's page size equals to bounds.
 */
- (NSData *)snapshotPDF;

/**
 Shortcut to set the layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Remove all sublayers.
 */
- (void)removeAllSublayers;

@property (nonatomic) CGFloat em_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat em_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat em_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat em_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat em_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat em_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGPoint em_center;      ///< Shortcut for center.
@property (nonatomic) CGFloat em_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat em_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint em_origin;      ///< Shortcut for frame.origin.
@property (nonatomic, getter=em_frameSize, setter=setEM_FrameSize:) CGSize  em_size; ///< Shortcut for frame.size.


@property (nonatomic) CGFloat em_transformRotation;     ///< key path "tranform.rotation"
@property (nonatomic) CGFloat em_transformRotationX;    ///< key path "tranform.rotation.x"
@property (nonatomic) CGFloat em_transformRotationY;    ///< key path "tranform.rotation.y"
@property (nonatomic) CGFloat em_transformRotationZ;    ///< key path "tranform.rotation.z"
@property (nonatomic) CGFloat em_transformScale;        ///< key path "tranform.scale"
@property (nonatomic) CGFloat em_transformScaleX;       ///< key path "tranform.scale.x"
@property (nonatomic) CGFloat em_transformScaleY;       ///< key path "tranform.scale.y"
@property (nonatomic) CGFloat em_transformScaleZ;       ///< key path "tranform.scale.z"
@property (nonatomic) CGFloat em_transformTranslationX; ///< key path "tranform.translation.x"
@property (nonatomic) CGFloat em_transformTranslationY; ///< key path "tranform.translation.y"
@property (nonatomic) CGFloat em_transformTranslationZ; ///< key path "tranform.translation.z"

/**
 Shortcut for transform.m34, -1/1000 is a good value.
 It should be set before other transform shortcut.
 */
@property (nonatomic, assign) CGFloat em_transformDepth;

/**
 Wrapper for `contentsGravity` property.
 */
@property (nonatomic, assign) UIViewContentMode em_contentMode;

/**
 Add a fade animation to layer's contents when the contents is changed.
 
 @param duration Animation duration
 @param curve    Animation curve.
 */
- (void)addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve;

/**
 Cancel fade animation which is added with "-addFadeAnimationWithDuration:curve:".
 */
- (void)removePreviousFadeAnimation;

@end
