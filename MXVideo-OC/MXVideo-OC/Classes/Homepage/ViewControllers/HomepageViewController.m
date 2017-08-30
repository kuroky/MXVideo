//
//  HomepageViewController.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/29.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "HomepageViewController.h"
#import "ResVideoModel.h"
#import "MXResVideos.h"
#import "ResVideoCell.h"

static NSString *const  kResVideoCell   =   @"resVideoCell";

@interface HomepageViewController ()

@end

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUI];
    [self requestData];
}

- (void)setupData {
    self.dataList = [NSMutableArray array];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"推荐";
    [self setupTableView];
}

- (void)setupTableView {
    self.cellIdentifier = kResVideoCell;
    self.stabledCellHeight = 110;
    UINib *nib = [UINib nibWithNibName:@"ResVideoCell" bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:kResVideoCell];
    [self em_reloadData:^(ResVideoCell *cell, ResVideoModel *item) {
        [cell configVideoItem:item];
    }];
}

- (void)requestData {
    [[EMProgressHUD sharedHUD] showHUDWithTitle:@""
                                 holdMainThread:YES];
    MXResVideos *request = [MXResVideos new];
    [request em_requestWithCompletion:^(EMResponse *response) {
        [[EMProgressHUD sharedHUD] hideHUD];
        NSArray *list = response.respData[@"data"];
        NSArray *items = [ResVideoModel em_convertModelWithJsonArr:list];
        [self.dataList addObjectsFromArray:items];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
