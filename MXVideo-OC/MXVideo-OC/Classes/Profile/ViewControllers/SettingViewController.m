//
//  SettingViewController.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/30.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCell.h"
#import "SettingItem.h"

static NSString *const kSettingCell =   @"settingCell";

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
    [self setupTableView];
}

- (void)setupTableView {
    self.stabledCellHeight = 50;
    self.cellIdentifier = kSettingCell;
    self.refreshHeaderHidden = YES;
    self.refreshFooterHidden = YES;
    UINib *nib = [UINib nibWithNibName:@"SettingCell" bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:kSettingCell];
    
    [self em_reloadData:^(SettingCell *cell, SettingItem *item) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
