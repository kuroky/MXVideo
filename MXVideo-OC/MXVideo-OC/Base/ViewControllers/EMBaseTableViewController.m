//
//  EMBaseTableViewController.m
//  Emucoo
//
//  Created by kuroky on 2017/6/20.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "EMBaseTableViewController.h"

@interface EMBaseTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic, readwrite) UITableView *tableView;
@property (nonatomic, copy) EMCellConfigBlock handler;

@end

@implementation EMBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self em_setupUI];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

- (void)em_setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor em_colorWithHexString:@"e5e5e5"];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.mj_header = [EMRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(em_headerRefresh)];
    self.tableView.mj_footer = [EMRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(em_footerRefresh)];
    self.em_count = 20;
}

- (void)setRefreshHeaderHidden:(BOOL)refreshHeaderHidden {
    _refreshHeaderHidden = refreshHeaderHidden;
    if (refreshHeaderHidden) {
        self.tableView.mj_header.hidden = YES;
    }
}

- (void)setRefreshFooterHidden:(BOOL)refreshFooterHidden {
    _refreshFooterHidden = refreshFooterHidden;
    if (refreshFooterHidden) {
        self.tableView.mj_footer.hidden = YES;
    }
}

- (void)em_headerRefresh {
    [self.tableView reloadData];
    self.em_start = 0;
    [self.tableView.mj_header endRefreshing];
    if (!self.refreshFooterHidden) {
        self.tableView.mj_footer.hidden = NO;
    }
}

- (void)em_footerRefresh {
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
    if (self.em_start % self.em_count != 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    else {
        self.tableView.mj_footer.hidden = NO;
    }
}

- (void)em_reloadData:(EMCellConfigBlock)block {
    if (!self.handler) {
        self.handler = [block copy];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.sectionMode) {
        return self.dataList.count;
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.EMHeadHeightBlock) {
        return self.EMHeadHeightBlock(section);
    }
    else {
        return self.sectionHeaderHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.EMFootHeightBlock) {
        return self.EMFootHeightBlock(section);
    }
    else {
        return self.sectionFooterHeight;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.sectionMode) {
        return 1;
    }
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.EMCellHeightBlock) {
        return self.EMCellHeightBlock(indexPath.row);
    }
    else {
        return self.stabledCellHeight;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If cell margins are derived from the width of the readableContentGuide.
    // NS_AVAILABLE_IOS(9_0)，需进行判断
    // 设置为 NO，防止在横屏时留白
    if ([tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
        tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    
    // Prevent the cell from inheriting the Table View's margin settings.
    // NS_AVAILABLE_IOS(8_0)，需进行判断
    // 阻止 Cell 继承来自 TableView 相关的设置（LayoutMargins or SeparatorInset），设置为 NO 后，Cell 可以独立地设置其自身的分割线边距而不依赖于 TableView
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Remove seperator inset.
    // NS_AVAILABLE_IOS(8_0)，需进行判断
    // 移除 Cell 的 layoutMargins（即设置为 0）
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sectionMode) {
        return self.dataList[indexPath.section];
    }
    return self.dataList[indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    if (self.handler && cell) {
        self.handler(cell, item);
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
