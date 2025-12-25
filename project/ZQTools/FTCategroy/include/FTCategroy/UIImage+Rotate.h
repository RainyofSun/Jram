//
//  UIImage+rotate.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rotate)
/**
 以角度旋转图片
 
 @param degrees 角度
 @return 旋转后的图片
 */
- (UIImage *)rotateByDegrees:(CGFloat)degrees;
/**
 以弧度旋转图片
 
 @param radians 弧度
 @return 旋转后的图片
 */
- (UIImage *)rotateByRadians:(CGFloat)radians;
- (UIImage *)rotateByOrientation:(UIImageOrientation)orientation;
/** 垂直翻转 */

- (UIImage *)flipVertical;
/** 水平翻转 */
- (UIImage *)flipHorizontal;
@end
