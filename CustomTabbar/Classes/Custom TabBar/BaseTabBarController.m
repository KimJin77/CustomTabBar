//
//  BaseTabbarController.m
//  CustomTabbar
//
//  Created by Sim Jin on 2016/10/27.
//  Copyright © 2016年 UFunnetwork. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseTabBar.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseTabBar *tabBar = [[BaseTabBar alloc] init];
    tabBar.buttonHeight = 50;
    tabBar.buttonWidth = 50;
    tabBar.tapBlock = ^() {
        NSLog(@"You did tapped center button");
    };
    // 利用KVO来设置TabBar
    [self setValue:tabBar forKeyPath:@"tabBar"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
