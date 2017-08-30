//
//  UIScrollView+EMAdd.h
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIScrollView->Category
 */
@interface UIScrollView (EMAdd)

/**
 *  Scroll content to top with animation.
 */
- (void)em_scrollToTop;

/**
 *  Scroll content to bottom with animation.
 */
- (void)em_scrollToBottom;

/**
 *  Scroll content to left with animation.
 */
- (void)em_scrollToLeft;

/**
 *  Scroll content to right with animation.
 */
- (void)em_scrollToRight;

/**
 * Scroll content to top.
 
 @param animated  Use animation.
 */
- (void)em_scrollToTopAnimated:(BOOL)animated;

/**
 Scroll content to bottom.
 
 @param animated  Use animation.
 */
- (void)em_scrollToBottomAnimated:(BOOL)animated;

/**
 Scroll content to left.
 
 @param animated  Use animation.
 */
- (void)em_scrollToLeftAnimated:(BOOL)animated;

/**
 Scroll content to right.
 
 @param animated  Use animation.
 */
- (void)em_scrollToRightAnimated:(BOOL)animated;

@end
