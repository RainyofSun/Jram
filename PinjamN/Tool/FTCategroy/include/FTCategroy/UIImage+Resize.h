//
//  UIImage+Resize.h
//  Moments
//
//  Created by jiangzhichao on 15/11/6.
//  Copyright © 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

/// 从照片中线点拉伸照片
- (UIImage *)stretchableImageWithCenter;

/// 裁剪图片
- (UIImage *)imageCroppedToRect:(CGRect)rect;

/// 拉伸图片
- (UIImage *)stretchableImage;

/// 将image等比缩小，使其长和宽像素都小于maxSize
- (UIImage *)limitImageToSize:(CGFloat)maxSize;

@end
