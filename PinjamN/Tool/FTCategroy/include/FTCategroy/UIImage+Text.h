//
//  UIImage+Text.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (Text)
/**
 生成文字图片，使用30号字体， 图片尺寸 30x30
 
 @param text 文字
 @return 图片
 */+ (UIImage *)imageFromText:(NSString *)text;
/**
 生成文字图片
 
 @param text 文字
 @param font 字体
 @param size 图片尺寸
 @return 图片
 */
+ (UIImage *)imageFromText:(NSString *)text font:(UIFont *)font size:(CGSize)size;
@end
