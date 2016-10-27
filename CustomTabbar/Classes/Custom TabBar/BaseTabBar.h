//
//  BaseTabBar.h
//  CustomTabbar
//
//  Created by Sim Jin on 2016/10/27.
//  Copyright © 2016年 UFunnetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBar : UITabBar

/// Button that layout in the middle
@property (nonatomic, strong) UIButton *centerButton;

/// Button width. If button is a circle, buttonWidth shoule equal to buttonHeight
@property (nonatomic, assign) CGFloat buttonWidth;

/// Button height. If button is a circle, buttonHeight shoule equal to buttonWidth
@property (nonatomic, assign) CGFloat buttonHeight;

/// Block that handle button event
@property (nonatomic, copy) void (^tapBlock)();

@end
