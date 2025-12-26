//
//  UILabel+Font.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UILabel (Font)
/**
 设置字体、颜色
 
 @param font 字体
 @param color 颜色
 */
- (void)setFont:(nullable UIFont *)font color:(nullable UIColor *)color;
/**
 设置字体、颜色、背景色
 
 @param font 字体
 @param color 颜色
 @param backgroundColor 背景色
 */
- (void)setFont:(nullable UIFont *)font color:(nullable UIColor *)color backgroundColor:(nullable UIColor *)backgroundColor;
/**
 设置字体、颜色、文本
 
 @param font 字体
 @param color 颜色
 @param text 文本
 */
- (void)setFont:(nullable UIFont *)font color:(nullable UIColor *)color text:(nullable NSString *)text;
/**
 设置字体、颜色、文本、背景色
 
 @param font 字体
 @param color 颜色
 @param text 文本
 @param backgroundColor 背景色
 */
- (void)setFont:(nullable UIFont *)font color:(nullable UIColor *)color text:(nullable NSString *)text backgroundColor:(nullable UIColor *)backgroundColor;
/**
 设置字体、颜色、文本、对齐方式
 
 @param font 字体
 @param color 颜色
 @param text 文本
 @param alignment 对齐方式
 */
- (void)setFont:(nullable UIFont *)font color:(nullable UIColor *)color text:(nullable NSString *)text alignment:(NSTextAlignment)alignment;


@end
