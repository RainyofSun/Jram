//
//  NSArray+BAFString.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSArray (NSString)
/**
 返回数组 Json 序列化后的字符串
 
 @return Json 序列化后的字符串
 */
- (nullable NSString *)JSONString;
/**
 返回一个链接数组元素的字符串, 如果数组为空，则返回空字符串
 
 比如：
 
 NSArray *array = @[@"h", @"e", @"llo"];
 
 array = [array join];
 
 array 为 @"hello";
 
 @return 连接后的字符串
 */
- (nonnull NSString *)join;
/**
 返回一个链接数组元素的字符串, 以传入字符串参数做分隔, 如果数组为空，则返回空字符串
 
 比如：
 
 NSArray *array = @[@"hello", @"world!", @"Jeff."];
 
 array = [array join:@" "];
 
 array 为 @"hello world! Jeff.";
 
 @return 连接后的字符串
 */
- (nonnull NSString *)join:(nonnull NSString *)separator;

/* 将字符串数组，通过给定的分隔字符转化成字符串返回 例如[1，2，3] ---> @"1,2,3"*/
- (NSString *)convertStringArrayToStringBySeparateChar:(NSString *)string;
@end
NS_ASSUME_NONNULL_END
