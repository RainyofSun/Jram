//
//  UIImage+Album.h
//  Moments
//
//  Created by 孙帆 on 15/11/10.
//  Copyright © 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, AlbumImageType)
{
    // 小正方形的缩略图
    AlbumImageType_Thumbnail = 0,
    // 按原始资源长宽比例的缩略图
    AlbumImageType_AspectRatioThumbnail,
    // 满屏的图片
    AlbumImageType_FullScreenImage,
    // 完全分辨率的图片
    AlbumImageType_FullResolutionImage
};

@interface UIImage (Album)

//+ (void)imageForURL:(NSString *)assetURL albumImageType:(AlbumImageType)albumImageType resultBlock:(void (^)(UIImage *image))resultBlock failureBlock:(void (^)(NSError *error))failureBlock;

@end
