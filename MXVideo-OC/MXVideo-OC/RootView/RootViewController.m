//
//  RootViewController.m
//  MXVideo-OC
//
//  Created by kuroky on 2017/8/28.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "RootViewController.h"
#import "HomepageViewController.h"
#import "LocalVideoViewController.h"
#import "SettingViewController.h"
#import "MXBaseNavigationController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAppreance];
    self.viewControllers = [self setupViewControllers];
}

- (void)setupAppreance {
    UIColor *nColor = [UIColor em_colorWithHexString:@"909293"];
    UIColor *sColor = [UIColor em_colorWithHexString:@"0da1e5"];
    NSDictionary *att = @{NSForegroundColorAttributeName: nColor};
    NSDictionary *att1 = @{NSForegroundColorAttributeName: sColor};
    [[UITabBarItem appearance] setTitleTextAttributes:att
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:att1
                                             forState:UIControlStateSelected];
}

- (NSArray *)setupViewControllers {
    LocalVideoViewController *localVC = [LocalVideoViewController new];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"资料库"
                                                        image:nil
                                                selectedImage:nil];
    MXBaseNavigationController *navi1 = [[MXBaseNavigationController alloc] initWithRootViewController:localVC];
    navi1.tabBarItem = item1;
    
    HomepageViewController *homeVC = [HomepageViewController new];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"推荐"
                                                        image:nil
                                                selectedImage:nil];
    MXBaseNavigationController *navi2 = [[MXBaseNavigationController alloc] initWithRootViewController:homeVC];
    navi2.tabBarItem = item2;
    
    SettingViewController *settingVC = [SettingViewController new];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"设置"
                                                        image:nil
                                                selectedImage:nil];
    MXBaseNavigationController *navi3 = [[MXBaseNavigationController alloc] initWithRootViewController:settingVC];
    navi3.tabBarItem = item3;
    return @[navi1, navi2, navi3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
