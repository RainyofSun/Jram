//
//  UIView+Position.h
//  YueWan
//
//  Created by jiangzhichao on 15/9/15.
//  Copyright (c) 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Position)
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic, readonly) UIViewController * _Nullable viewController;
@property (nonatomic, readonly, getter = isVisible) BOOL visible;

- (BOOL)isVisibleOnScreen;

- (void)removeAllSubviews;

- (void)centerHorizontallyInSuperViewWithTop:(CGFloat)top;
- (void)centerHorizontallyInRect:(CGRect)rect top:(CGFloat)top;
- (void)centerHorizontallyInRect:(CGRect)rect;
- (void)centerInSuperViewWithLeftOffset:(CGFloat)left;

- (void)centerInSuperView;

- (void) circleView;
- (void)roundedRect:(CGFloat)radius;
/**
 *  视图移动到最前面
 *
 */
- (void)bringToFront;
/**
 *  添加子视图到最后
 *
 */
- (void)addSubviewToBack:(nonnull UIView *)view;
/**
 *  视图移动到最后
 *
 */
- (void)sendToBack;
/**
 *  视图向上移动一个层级
 *
 */
- (void)bringSubviewIndexOneLevelUp;
/**
 *  是否是顶视图
 *
 */
- (BOOL)isTheFrontSubview;
/**
 *  是否是底视图
 *
 */
- (BOOL)isTheBackSubview;
/**
 *  是否是传入视图的父视图
 *
 */
- (BOOL)isSuperviewOfView:(nonnull UIView *)view;
/**
 *  是否是传入视图的子视图
 *
 */
- (BOOL)isSubviewOfView:(nonnull UIView *)view;
/**
 *  根据响应链找到第一个找到的 viewController
 *
 */
- (nullable UIViewController *)firstViewController;

/**
*  是否屏幕内可见
*
*/
- (BOOL)isDisplayedInScreen;


@end
