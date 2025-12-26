//
//  UIImageView+PHAsset.h
//  Moments
//
//  Created by babytree-ios on 16/10/11.
//  Copyright © 2016年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

extern NSInteger const kPHAssetMaxSizeCloseToScreenWidth;
extern NSInteger const kPHAssetMaxSizeLittleCellImageWidth;
#define kPHAssetMaxSizePRDWidth (([UIScreen width] - 56) / 4.0)


@interface UIImageView (PHAsset)

/// 输入参数是asset，maxWidthOrLength是最大长或者最大宽，一般传一个就好了，例如maxWidthOrLength如果是1000的话，会将原始图片的长或者宽的最大值缩到1000，然后维持原有比例。
- (void)setImageWithPHAsset:(PHAsset *)asset maxSize:(NSInteger)maxWidthOrLength complete:(void(^)(UIImage *image))completeBlock;

/// 输入参数是localIdentifier
- (void)setImageWithLocalIdentifier:(NSString *)localIdentifier maxSize:(NSInteger)maxWidthOrLength complete:(void(^)(UIImage *image))completeBlock;

@end
