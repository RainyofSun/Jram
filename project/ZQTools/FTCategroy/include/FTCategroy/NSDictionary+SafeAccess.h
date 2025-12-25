//
//  NSDictionary+SafeAccess.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (SafeAccess)
/**
 检查是否包含该字段
 
 @param key key
 @return YES or NO
 */
- (BOOL)hasKey:(NSString *)key;
/**
 取 NSString 类型数据
 
 @param key key
 @return NSString 类型数据，如果不存在，则为 nil
 */
- (NSString*)stringForKey:(id)key;
- (NSString*)stringForKey:(id)key defaultValue:(NSString *)defaultValue;
/**
 取 NSString 类型数据, 如果不存在，用 defaultString 代替
 
 @param key key
 @return NSString 类型数据，如果不存在，则为 defaultString
 */
- (NSString*)stringForKey:(id)key defaultString:(NSString *)defaultValue;

- (NSNumber*)numberForKey:(id)key;

- (NSDecimalNumber *)decimalNumberForKey:(id)key;
/**
 取 NSArray 类型数据
 
 @param key key
 @return NSArray 类型数据，如果不存在，则为 nil
 */
- (NSArray*)arrayForKey:(id)key;
/**
 取 NSDictionary 类型数据
 
 @param key key
 @return NSDictionary 类型数据，如果不存在，则为 nil
 */
- (NSDictionary*)dictionaryForKey:(id)key;
/**
 取 NSInteger 类型数据
 
 @param key key
 @return NSInteger 类型数据，如果不存在，则为 0
 */
- (NSInteger)integerForKey:(id)key;

- (NSUInteger)unsignedIntegerForKey:(id)key;
/**
 取 BOOL 类型数据
 
 @param key key
 @return BOOL 类型数据，如果不存在，则为 NO
 */
- (BOOL)boolForKey:(id)key;

- (int16_t)int16ForKey:(id)key;

- (int32_t)int32ForKey:(id)key;

- (int64_t)int64ForKey:(id)key;

- (char)charForKey:(id)key;

- (short)shortForKey:(id)key;
/**
 取 float 类型数据
 
 @param key key
 @return float 类型数据，如果不存在，则为 0.0f
 */
- (float)floatForKey:(id)key;
/**
 取 double 类型数据
 
 @param key key
 @return double 类型数据，如果不存在，则为 0.0f
 */
- (double)doubleForKey:(id)key;

- (long long)longForKey:(NSString *)key;
/**
 取long long类型数据
 
 @param key key
 @return long long 类型数据，如果不存在，则为 0
 */
- (long long)longLongForKey:(id)key;

- (unsigned long long)unsignedLongLongForKey:(id)key;

- (NSDate *)dateForKey:(id)key dateFormat:(NSString *)dateFormat;

//CG
- (CGFloat)CGFloatForKey:(id)key;
/**
 取 CGPoint 类型数据
 
 @param key key
 @return CGPoint 类型数据，如果不存在，则为 CGPointZero
 */
- (CGPoint)pointForKey:(id)key;
/**
 取 CGSize 类型数据
 
 @param key key
 @return CGSize 类型数据，如果不存在，则为 CGSizeZero
 */
- (CGSize)sizeForKey:(id)key;
/**
 取 CGRect 类型数据
 
 @param key key
 @return CGRect 类型数据，如果不存在，则为 CGRectZero
 */
- (CGRect)rectForKey:(id)key;
@end
