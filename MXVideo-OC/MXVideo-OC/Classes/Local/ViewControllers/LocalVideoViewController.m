//
//  LocalVideoViewController.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/29.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "LocalVideoViewController.h"
#import "MXResVideos.h"

@interface LocalVideoViewController ()

@end

@implementation LocalVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setupData];
    [self setupUI];
}

- (void)setupData {
}

- (void)setupUI {
    self.navigationItem.title = @"本地";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
