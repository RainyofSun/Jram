//
//  UIView+CornerRadius.h
//  Moments
//
//  Created by Alan on 2017/6/4.
//  Copyright © 2017年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HMViewCornerType) {
    HMViewCornerTypeDefaul = 1,     // 四个圆角
    HMViewCornerTypeTop,            // 上面两个圆角
    HMViewCornerTypeBottom,         // 下面两个圆角
    HMViewCornerTypeRight,          // 右边整体圆角
    HMViewCornerTypeLeft,           // 左边整体圆角
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CornerRadius)

@property (nonatomic, strong, readonly) CAShapeLayer *s_shapeLayer;

/// 默认4个圆角，没有边框，cornerRadius：4,由于使用的是layer.mask，所以只会显示mask上的视图，其他的边框阴影都不会显示。
- (void)addCornerRadius;
- (void)addCornerRadius:(CGFloat)radius;
- (void)addCornerWithType:(HMViewCornerType)type;
- (void)addCornerWithType:(HMViewCornerType)type radius:(CGFloat)radius;

/// 圆角view 有边框 默认边框0.5 黑色，使用addSubLayer:,需要设置fillColor，可以显示边框与阴影。
- (void)addCornerRadiusWithBorder;
///  圆角view 无边框 有默认阴影，使用addSubLayer:,需要设置fillColor，可以显示边框与阴影。
- (void)addCornerRadiusWithShadow;
- (void)addCornerWithborderWidth:(CGFloat)borderWidth;
- (void)addCornerWithborderWidth:(CGFloat)borderWidth 
                     borderColor:(UIColor *)borderColor;
- (void)addCornerRadius:(CGFloat)radius
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor;


- (void)addCornerWithType:(HMViewCornerType)type
                   radius:(CGFloat)radius
                fillColor:(UIColor *)fillColor 
              borderWidth:(CGFloat)borderWidth
              borderColor:(UIColor *)strokeColor;

- (void)removeCurrentCornerLayer;

/// 添加阴影 默认透明度0.1 黑色阴影
- (void)addCornerShadow;
/// 主Layer上添加阴影
- (void)mainLayerAddcornerShadow;

/*
 *  下面3个方法设置圆角
 */
- (void)roundedRect:(CGFloat)radius;
- (void)roundedRect:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;

- (void)roundCornersTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight;

- (void)roundCorners:(UIRectCorner)rectCorner radius:(CGFloat)radius;

@end
NS_ASSUME_NONNULL_END
