//
//  UIView+UIViewController.h
//  Moments
//
//  Created by jiangzhichao on 15/11/10.
//  Copyright © 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewController)

// 获取View所在VC，不要在Init中使用
- (UIViewController *)viewController;

@end
