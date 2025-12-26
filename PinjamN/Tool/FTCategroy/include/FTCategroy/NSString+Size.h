//
//  NSString+Size.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Size)
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

- (CGSize)sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGSize)sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

- (CGSize)calcSizemaxWidth:(CGFloat)maxWidth font:(UIFont*)font;

+ (NSString *)reverseString:(NSString *)strSrc;


// 圈子贴吧页面计算"置顶""新""精"等的高度
+ (NSString *)spaceWithFont:(UIFont *)font top:(BOOL)bTop new:(BOOL)bNew best:(BOOL)bBest help:(BOOL)bHelp pic:(BOOL)bPic add:(NSInteger)addSpaceCount;

+ (NSString *)spaceWithFont:(UIFont *)font topWidth:(CGFloat)topWidth newWidth:(CGFloat)newWidth bestWidth:(CGFloat)bestWidth helpWidth:(CGFloat)helpWidth picWidth:(CGFloat)picWidth add:(NSInteger)addSpaceCount;

// 计算字符串显示区域
- (CGSize)sizeInSize:(CGSize)size andFont:(UIFont *)font;
/**
 计算在特定width字体下的展示Size
 
 @param maxWidth 最大允许宽度
 @param font 字体
 @return 计算后的尺寸
 */
- (CGSize)sizeWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font;
/**
 计算在特定Size字体下的展示Size
 
 @param size 最大允许Size
 @param font 字体
 @return 计算后的尺寸
 */
- (CGSize)sizeWithMaxSize:(CGSize)size font:(UIFont *)font;
- (CGSize)sizeWithMaxSize:(CGSize)size font:(UIFont *)font paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;
/**
 计算字符串在特定字体下的展示宽度
 
 @param font 字体
 @return 预期Size
 */
- (CGSize)sizeWithFont:(UIFont *)font;          /* 可以获取一行的宽度 */

@end
