//
//  NSString+Utility.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

#define MoneyUnitRMB @"¥"

@interface NSString (Utility)
/**
 字符串转换成NSDate对象（NSUTF8StringEncoding）
 */
- (NSData *)toData;
/**
 生成一个 UUID
 */
+ (NSString *)getUUID;              /* 生成一个UDID */
/**
 获取文件名（路径最后一项）
 */
- (NSString *)getFileName;          /* 获取文件路径最后一项 */

/*
 * Returns the long value of the string
 */
- (long)longValue;
- (long long)longLongValue;
/**
 字符串转换成C String的长度
 
 */
- (NSInteger)lengthByCString;               /*转换成 C string的length*/

- (BOOL)includeChinese;

@end
