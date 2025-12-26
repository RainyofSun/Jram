//
//  UIImage+Scale.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)
/**
 缩放图片到指定大小
 
 @param size 新尺寸
 @return 缩放后的图片
 */
- (UIImage *)scaleToSize:(CGSize)size;
/**
 按比例，AspectFit 到指定大小
 
 @param size 新尺寸
 @return 缩放后的图片
 */
- (UIImage *)scaleToSizeAspectFit:(CGSize)size;
/**
 按比例，AspectFill 到指定大小
 
 @param size 新尺寸
 @return 缩放后的图片
 */
- (UIImage *)scaleToSizeAspectFill:(CGSize)size;
@end
