//
//  UIImage+RoundRect.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundRect)

// 图片先压缩到size大小然后再做圆角大小为r，然后在view上圆角与图片可能被等比拉伸/缩放
+ (UIImage *)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;
+ (UIImage *)createRoundedRectImage:(UIImage*)image radius:(NSInteger)r;

@end
