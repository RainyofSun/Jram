//
//  UIColor+Utility.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utility)
/**
 随机取一个颜色
 
 @return UIColor
 */
+ (UIColor *)randomColor;
/**
 字符串描述色值，rgb 形式
 
 @return 描述
 */
- (NSString *)stringFromColor;          /* 描述用的String*/
/**
 字符串描述色值，16进制形式
 
 @return 描述
 */
- (NSString *)hexStringFromColor;
/**
 生成一个 1x1 的纯色图片
 
 @return UIImage
 */
- (UIImage *)toImage;
@end
