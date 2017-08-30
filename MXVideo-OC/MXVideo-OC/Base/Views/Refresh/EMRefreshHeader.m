//
//  EMRefreshHeader.m
//  Emucoo
//
//  Created by kuroky on 2017/6/20.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMRefreshHeader.h"

@implementation EMRefreshHeader

- (void)prepare {
    [super prepare];
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.hidden = YES;
    
    [self setImages:@[[UIImage imageNamed:@"top_icon_pullToRefresh"]]
           forState:MJRefreshStateIdle];
    [self setImages:@[[UIImage imageNamed:@"top_icon_pullToRefresh"],
                      [UIImage imageNamed:@"top_icon_pullToRefresh_1"],
                      [UIImage imageNamed:@"top_icon_pullToRefresh_2"],
                      [UIImage imageNamed:@"top_icon_pullToRefresh_3"]]
           forState:MJRefreshStateRefreshing];
    [self setImages:@[[UIImage imageNamed:@"top_icon_pullToRefresh_2"]]
           forState:MJRefreshStatePulling];
    [self setImages:@[[UIImage imageNamed:@"top_icon_pullToRefresh"]]
           forState:MJRefreshStateWillRefresh];
}

- (void)placeSubviews {
    [super placeSubviews];
}

@end
