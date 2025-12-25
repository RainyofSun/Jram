//
//  UIFont+Utility.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIFont (Utility)

#pragma mark - ** Utilties **

/*
 *  以下方法返回指定的字体
 */
+ (nonnull UIFont *)ultraLightSystemFontOfSize:(CGFloat)fontSize NS_AVAILABLE_IOS(8_0);
+ (nonnull UIFont *)thinSystemFontOfSize:(CGFloat)fontSize NS_AVAILABLE_IOS(8_0);
+ (nonnull UIFont *)lightSystemFontOfSize:(CGFloat)fontSize;
+ (nonnull UIFont *)mediumSystemFontOfSize:(CGFloat)fontSize;
+ (nonnull UIFont *)semiboldSystemFontOfSize:(CGFloat)fontSize NS_AVAILABLE_IOS(9_0);
+ (nonnull UIFont *)heavySystemFontOfSize:(CGFloat)fontSize NS_AVAILABLE_IOS(9_0);
+ (nonnull UIFont *)blackSystemFontOfSize:(CGFloat)fontSize NS_AVAILABLE_IOS(9_0);

/*
 *  以下两个方法 返回以 iPhone 6 的屏宽比计算出的字号的系统字体
 */
+ (nonnull UIFont *)systemFontOfScaledSize:(CGFloat)fontSize;
+ (nonnull UIFont *)boldSystemFontOfScaledSize:(CGFloat)fontSize;


/*
 *  这个方法 返回是否成功注册自定义字体
 */
+ (BOOL)registerFontWithData:(nullable NSData *)data;


#pragma mark - ** Develop Helper **

+ (nonnull NSArray <NSString *> *)allFonts;

@end
