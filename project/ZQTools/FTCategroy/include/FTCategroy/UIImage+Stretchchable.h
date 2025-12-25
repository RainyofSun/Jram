//
//  UIImage+stretchchable.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (Stretchchable)

-(UIImage *) strethchableImageWithWidth:(CGFloat) width wihtHeight:(CGFloat) height withX:(CGFloat) x  withY:(CGFloat) y;
-(UIImage *) strethchableImageWithWidth:(CGFloat) width wihtHeight:(CGFloat) height withX1:(CGFloat) x1  withY1:(CGFloat) y1 withX2:(CGFloat) x2  withY2:(CGFloat) y2;
-(UIImage *) strethchableImageWithWidth:(CGFloat) width wihtHeight:(CGFloat) height withX1:(CGFloat) x1  withY1:(CGFloat) y1;
/**
 以中心点拉伸图片
 
 @return 以中心点拉伸的图片
 */
- (UIImage *)stretchableImageWithCenter;

@end
