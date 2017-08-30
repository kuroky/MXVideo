//
//  ProfileViewController.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/29.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "ProfileViewController.h"

static NSString *const kProfileCell =   @"profileCell";

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.navigationItem.title = @"设置";
    [self setupTableView];
}

- (void)setupTableView {
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
