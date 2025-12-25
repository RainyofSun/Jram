//
//  NSString+Trims.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Trims)
- (NSString *)stringByStrippingHTML;
- (NSString *)stringByRemovingScriptsAndStrippingHTML;

- (NSString *)trimmingWhitespace;
- (NSString *)trimmingWhitespaceAndNewlines;
- (NSString *)stringByReplacingString:(NSString *)searchString withString:(NSString *)newString;
/**
 移除两头的空格和换行符
 
 */
- (NSString *)trimSpaceAndNewLine;              /* 移除两头的空格和换行符 */
/**
 移除两头的空格
 
 */
- (NSString *)trimSpace;                        /* 移除两头的空格 */
/**
 移除两头的换行
 
 */
- (NSString *)trimNewline;                      /* 移除两头的换行符 */
/**
 移除所有的空格
 
 */
- (NSString *)trimAllSpace;
/**
 移除所有的换行
 
 */
- (NSString *)trimAllNewline;
/**
 移除头空格
 
 */
- (NSString *)trimLeftSpaceAndNewLine;          /* 移除左边的空格和换行符 */
/**
 移除尾空格
 
 */
- (NSString *)trimRightSpaceAndNewLine;         /* 移除右边的空格和换行符 */
/**
 移除输入字符串
 
 */
- (NSString *)trimString:(NSString *)string;    /* 移除所有指定的字符串 */

/**
 截取子字符串，防止越界、含有emoji表情时造成crash
 
 @param fromIndex index
 @return 子字符串
 */
- (NSString *)safe_substringFromIndex:(NSUInteger)fromIndex;
/**
 截取子字符串，防止越界、含有emoji表情时造成crash
 
 @param toIndex index
 @return 子字符串
 */
- (NSString *)safe_substringToIndex:(NSUInteger)toIndex;

// 计算子串儿，防止含有emoji表情时造成crash ToIndex
- (NSString *)substringSafelyToIndex:(NSUInteger)index;

// 计算子串儿，防止含有emoji表情时造成crash
- (NSString *)substringSafelyFromIndex:(NSUInteger)fromIndex ToIndex:(NSUInteger)toIndex;
@end
