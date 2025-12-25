//
//  NSString+Format.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Format)
/**
 字符串转换成数据存储格式  B KB、M、G
 
 */
+ (NSString *)stringByDataSizeFormat:(NSInteger) dataSize;          /* 从bit转化为KB、MB、GB */
/**
 字符串转换成价格格式  ¥100
 
 */
+ (NSString *)stringByMoneyFormat:(double) money;                   /* ¥100 */
/**
 字符串转换成大写价格格式  壹佰
 
 */
+ (NSString *)stringByChineseMoneyFormat:(double) money;            /* 壹佰 */
/**
 字符串转换成HEX格式
 
 */
+ (NSString *)stringByHexFormat:(long long int) hex;
/**
 字符串转换成拼音格式
 
 */
- (NSString *)pinyinString;
/**
 首字母大写
 
 */
- (NSString *)uppercaseFirstCharacterString;

// 将数字转化为XX万这种格式
+ (NSString *)howManyTenThousandDes:(long)count;

/// 将数字转换成这种格式  英文版10k 12k  其他xx万
+ (NSString *)howManykDes:(NSInteger)count isEn:(BOOL)isEn;

+ (NSString *)howManykLikes:(NSInteger)count isEn:(BOOL)isEn;
/// 用于直播，小数点后不能为0
+ (NSString *)howManykValues:(NSInteger)count isEn:(BOOL)isEn;
@end
