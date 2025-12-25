//
//  UIScreen+Frame.h
//  YueWan
//
//  Created by jiangzhichao on 15/8/21.
//  Copyright (c) 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Frame)

+ (CGSize)size;
+ (CGFloat)width;
+ (CGFloat)height;
+ (CGFloat)navBarHeight;
+ (CGFloat)tabBarHeight;
+ (CGFloat)statusBarHeight;
/// iPhoneX屏幕下边 home indicator的高度
+ (CGFloat)iPhoneXHomeIndicatorHeight;

+ (BOOL)isiPhoneX;

// add by dmj
/// 屏幕Scale
+ (CGFloat)screenScale;
/// 屏幕分辨率
+ (CGSize)screenResolution;

/// [UIScreen width] / 320
+ (CGFloat)sizeScale320;
/// [UIScreen width] / 375
+ (CGFloat)sizeScale375;
/// [UIScreen width] / 414
+ (CGFloat)sizeScale414;

@end
