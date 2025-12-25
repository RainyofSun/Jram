//
//  UIButton+Component.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIColor (Component)
#pragma mark - ** Color Components **
/**
 获取颜色的 space model
 
 @return CGColorSpaceModel
 */
@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;      /* 色彩空间 */
/**
 返回是否可以分解为 RGB
 
 @return YES or NO
 */
@property (nonatomic, readonly) BOOL canProvideRGBComponents;           /* 是否可以分解为 RGB */
/**
 获取 RGBA 颜色值，如果不可获取，返回 NO
 
 @param red R
 @param green G
 @param blue B
 @param alpha A
 @return YES or NO
 */
- (BOOL)red:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha;
/**
 获取 hue，saturation， brightness 和 alpha
 
 该方法是通过 RGB 转换的
 
 @param hue hue
 @param saturation saturation
 @param brightness brightness
 @param alpha alpha
 @return YES or NO
 */
- (BOOL)hue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha;
/**
 转换 RGB 到 HSV
 */
+ (void)red:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b toHue:(CGFloat *)pH saturation:(CGFloat *)pS brightness:(CGFloat *)pV;
/**
 转换 HSV 到 RGB
 */
+ (void)hue:(CGFloat)h saturation:(CGFloat)s brightness:(CGFloat)v toRed:(CGFloat *)r green:(CGFloat *)g blue:(CGFloat *)b;


@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;
@property (nonatomic, readonly) CGFloat white;


@property (nonatomic, readonly) CGFloat hue;            /* 色相值 */
@property (nonatomic, readonly) CGFloat saturation;     /* 饱和度值 */
@property (nonatomic, readonly) CGFloat brightness;     /* 明度值 */

@property (nonatomic, readonly) CGFloat alpha;
@property (nonatomic, readonly) CGFloat luminance;      /* 亮度 */

@property (nonatomic, readonly) UInt32 rgbHex;          /* RGB的16进制值 */
@end
