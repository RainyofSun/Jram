//
//  UIImage+Mask.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (Mask)
/**
 图片加颜色蒙版
 
 @param color 颜色
 @param rect 蒙版尺寸与位置
 @return 加了颜色蒙版后的图片
 */
- (UIImage *)imageWithColorMask:(UIColor*)color inRect:(CGRect)rect;

@end
