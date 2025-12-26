//
//  UIImage+Color.h
//  YueWan
//
//  Created by jiangzhichao on 15/10/19.
//  Copyright (c) 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 获取纯色的Image
 
 @param color 色值
 @param size 尺寸
 @return 颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
