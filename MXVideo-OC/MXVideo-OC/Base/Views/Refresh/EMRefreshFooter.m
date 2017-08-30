//
//  EMRefreshFooter.m
//  Emucoo
//
//  Created by kuroky on 2017/6/20.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMRefreshFooter.h"

@implementation EMRefreshFooter

- (void)prepare {
    [super prepare];
    // 默认底部控件100%出现时才会自动刷新
    //    self.triggerAutomaticallyRefreshPercent = 0.2;
    //
    //    self.ignoredScrollViewContentInsetBottom = 49.0;
    [self setTitle:@"没有更多了(>_<)" forState:MJRefreshStateNoMoreData];
}

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change {
    [super scrollViewContentSizeDidChange:change];
    // 设置位置
    //    if (self.scrollView.mj_contentH < self.scrollView.mj_h - self.mj_h - self.scrollView.mj_insetT) {
    ////        self.mj_y = self.scrollView.mj_h - self.scrollView.mj_insetT - self.scrollView.mj_insetB;
    //        if (!self.hidden) {
    //            [self beginRefreshing];
    //        }
    //    }else{
    //        self.mj_y = self.scrollView.mj_contentH;
    //    }
    //
}

- (void)endRefreshingWithNoMoreData {
    [super endRefreshingWithNoMoreData];
    [self setHidden:YES];
}

- (void)resetNoMoreData {
    [super resetNoMoreData];
    [self setHidden:NO];
}

@end
