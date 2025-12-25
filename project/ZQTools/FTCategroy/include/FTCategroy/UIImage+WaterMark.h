//
//  UIImage+WaterMark.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (WaterMark)
/**
 图片加水印
 
 @param mark 水印图片
 @param rect 尺寸与位置
 @return 加水印后的图片
 */
- (UIImage *)imageWithWaterMark:(UIImage *)mark inRect:(CGRect)rect;
/**
 图片加文字水印
 
 @param markString 水印文字
 @param rect 尺寸与位置
 @param color 文字颜色
 @param font 文字字体
 @return 加文字水印后的图片
 */
- (UIImage *)imageWithStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
/**
 图片加文字水印
 
 @param markString 水印文字
 @param point 位置
 @param color 文字颜色
 @param font 文字字体
 @return 加文字水印后的图片
 */
- (UIImage *)imageWithStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;
/**
 图片加文字水印, 带阴影参数
 
 @param markString 水印文字
 @param rect 尺寸与位置
 @param color 文字颜色
 @param font 颜色字体
 @param scolor 阴影颜色
 @param offset 阴影偏移
 @return 加文字水印后的图片
 */
- (UIImage *)imageWithStringWaterMarkAndShadow:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font shadowcolor:(UIColor *)scolor shadowoffset:(CGPoint)offset;

@end
