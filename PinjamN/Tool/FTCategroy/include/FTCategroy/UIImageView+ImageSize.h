//
//  UIImageView+ImageSize.h
//  Moments
//
//  Created by Geass on 1/27/16.
//  Copyright © 2016 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ImageSize)

// 网络screenScale 为 2， 本地screenScale 为1
- (void)oneThirdImageWithImage:(UIImage *)image scale:(CGFloat)screenScale;

// 网络screenScale 为 2， 本地screenScale 为1
- (void)oneThirdImageWithImage:(UIImage *)image scale:(CGFloat)screenScale imageHeight:(CGFloat)imageHeight;

- (void)oneThirdImageWithImage:(UIImage *)image scale:(CGFloat)screenScale imageHeight:(CGFloat)imageHeight width:(CGFloat)imageWidth;

@end
