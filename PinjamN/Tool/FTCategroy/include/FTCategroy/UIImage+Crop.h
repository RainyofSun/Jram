//
//  UIImage+crop.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (Crop)

/**
 裁剪图片
 
 @param rect 裁剪区域
 @return 裁剪后图片
 */
- (UIImage *)croppedToRect:(CGRect)rect;
/**
 裁剪为正方形图片
 
 @return 居中的正方形图片
 */
- (UIImage *)squareImage;
@end
