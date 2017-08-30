//
//  UIScrollView+EMAdd.m
//  Emucoo
//
//  Created by kuroky on 2017/7/3.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "UIScrollView+EMAdd.h"

@implementation UIScrollView (EMAdd)

- (void)em_scrollToTop {
    [self em_scrollToTopAnimated:YES];
}

- (void)em_scrollToBottom {
    [self em_scrollToBottomAnimated:YES];
}

- (void)em_scrollToLeft {
    [self em_scrollToLeftAnimated:YES];
}

- (void)em_scrollToRight {
    [self em_scrollToRightAnimated:YES];
}

- (void)em_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)em_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)em_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)em_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
