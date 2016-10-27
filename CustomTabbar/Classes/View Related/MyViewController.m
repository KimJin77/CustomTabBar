//
//  MyViewController.m
//  CustomTabbar
//
//  Created by Sim Jin on 2016/10/27.
//  Copyright © 2016年 UFunnetwork. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton *push = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
    push.center = self.view.center;
    [push setTitle:@"Push" forState:UIControlStateNormal];
    [push setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    push.backgroundColor = [UIColor whiteColor];
    [push addTarget:self action:@selector(pushNextViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
}

- (void)pushNextViewController {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor purpleColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)hidesBottomBarWhenPushed {
    return (self.navigationController.topViewController != self);
}
	

@end
