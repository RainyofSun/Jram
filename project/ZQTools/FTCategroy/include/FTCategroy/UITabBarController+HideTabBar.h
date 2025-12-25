//
//  UITabBarController+HideTabBar.h
//  pregnancy
//
//  Created by Kevin on 10/21/16.
//  Copyright © 2016 babytree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (HideTabBar)

- (void)setTabBarHidden:(BOOL)hidden;
- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
