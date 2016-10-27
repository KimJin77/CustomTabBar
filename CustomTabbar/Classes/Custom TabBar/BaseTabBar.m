//
//  BaseTabBar.m
//  CustomTabbar
//
//  Created by Sim Jin on 2016/10/27.
//  Copyright © 2016年 UFunnetwork. All rights reserved.
//

#import "BaseTabBar.h"

@implementation BaseTabBar

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
       	self.centerButton = ({
            UIButton *button = [[UIButton alloc] init];
            [button setBackgroundImage:[UIImage imageNamed:@"Instagram"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"Instagram"] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(didTappedCenterButton) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
        [self addSubview:self.centerButton];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat centerX = self.center.x;
    // 这里需要注意的是，如果想要获取self.center.y的值的话，获取出来的是tabbar在当前vc的view的坐标系的位置
    self.centerButton.frame = CGRectMake(centerX - self.buttonWidth/2, -20, self.buttonWidth, self.buttonHeight);

    Class class = NSClassFromString(@"UITabBarButton");
    int index = 0;
    int tabWidth = self.bounds.size.width / 3; // tab的数目，也可更改为5个
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:class]) {
            CGRect rect = view.frame;
            rect.origin.x = index * tabWidth;
            rect.size.width = tabWidth;
            view.frame = rect;
            index++;

            if (index == 1) index++;
        }
    }
}

// 拦截点击事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.hidden) {
        if ([self touchInCircle:self.centerButton.center radius:self.buttonWidth/2 targetPoint:point]) {
            return self.centerButton;
        } else {
			return [super hitTest:point withEvent:event];
        }
    }
    return [super hitTest:point withEvent:event];
}

// 判断点击点是否在按钮内
- (BOOL)touchInCircle:(CGPoint)center radius:(CGFloat)radius targetPoint:(CGPoint)point {
    CGFloat dist = sqrtf((point.x - center.x) * (point.x - center.x) + (point.y - center.y) * (point.y - center.y));
    return dist <= radius;
}

- (void)didTappedCenterButton {
    if (self.tapBlock) {
        self.tapBlock();
    }
}

@end
