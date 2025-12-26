//
//  UIImage+FaceDetect.h
//  Moments
//
//  Created by babytree-ios on 16/6/15.
//  Copyright © 2016年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat const kImage4FaceDetectMaxSize;

@interface UIImage (FaceDetect)

/// 返回图片的人脸位置（人脸区域所占百分比），只返回置信度最高的一张脸，如果没有识别到人脸则，返回@""。
- (NSString*)facePositionInUIImage;

@end
