//
//  UIImage+Category.h
//  Moments
//
//  Created by Alan on 2017/7/18.
//  Copyright © 2017年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

/// 获取当前LaunchImage中使用的image
+ (UIImage *)getTheLaunchImage;
/**
 全屏截图
 
 @return 截图
 */
+ (UIImage *)screenshot;

// 绘制五角星图片
+ (UIImage *)imageFivePointStarBySize:(CGSize)size fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor;

@end
