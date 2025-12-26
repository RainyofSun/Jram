//
//  UIView+InnerShadow.h
//  Moments
//
//  Created by 孙帆 on 15/11/10.
//  Copyright © 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (InnerShadow)

- (void) addCurveShadow;
- (void) addCurveShadowWithColor:(UIColor *_Nullable)color;

/**
 *  Remove the shadow around the UIView
 */
- (void)removeShadow;

- (void) addShadow:(NSInteger)borderWidth Radius:(CGFloat)radius BorderColor:(nullable UIColor *)borderColor ShadowColor:(nullable UIColor *)shadowColor;
- (void) addShadow:(NSInteger)borderWidth Radius:(CGFloat)radius BorderColor:(nullable UIColor *)borderColor ShadowColor:(nullable UIColor *)shadowColor Offset:(CGSize)offset Opacity:(float)opacity;

@end
