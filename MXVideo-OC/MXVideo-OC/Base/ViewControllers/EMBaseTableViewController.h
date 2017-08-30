//
//  EMBaseTableViewController.h
//  Emucoo
//
//  Created by kuroky on 2017/6/20.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "MXBaseViewController.h"
#import "EMRefreshHeader.h"
#import "EMRefreshFooter.h"

/**
 cell设置
 
 @param cell custom cell
 @param item model data
 */
typedef void (^EMCellConfigBlock)(id cell, id item);

/**
 UIViewController + UITableView + PullRefresh
 */
@interface EMBaseTableViewController : MXBaseViewController

/**
 reload tableview之前调用
 
 @param block cell设置
 */
- (void)em_reloadData:(EMCellConfigBlock)block;

/**
 cell identifier
 */
@property (nonatomic, copy) NSString *cellIdentifier;

/**
 是否只有section或只有rows (不支持section下有多个rows) (默认 section count == 1)
 */
@property (nonatomic) BOOL sectionMode;

/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray *dataList;

/**
 cell固定高度
 */
@property (nonatomic) CGFloat stabledCellHeight;

/**
 section 头部高度
 */
@property (nonatomic) CGFloat sectionHeaderHeight;

/**
 section 脚部高度
 */
@property (nonatomic) CGFloat sectionFooterHeight;

/**
 配置cell高度
 */
@property (nonatomic, copy) CGFloat (^EMCellHeightBlock)(NSInteger index);

/**
 自定义section 头部高度
 */
@property (nonatomic, copy) CGFloat (^EMHeadHeightBlock)(NSInteger index);

/**
 自定义section 脚部高度
 */
@property (nonatomic, copy) CGFloat (^EMFootHeightBlock)(NSInteger index);

#pragma mark - Refresh
@property (nonatomic) BOOL refreshHeaderHidden; // 隐藏头部
@property (nonatomic) BOOL refreshFooterHidden; // 隐藏底部

@property (nonatomic) NSInteger em_start;
@property (nonatomic) NSInteger em_count;

@property (nonatomic, strong, readonly) UITableView *tableView;

- (void)em_headerRefresh; // 下拉刷新

- (void)em_footerRefresh; // 上拉刷新


@end
