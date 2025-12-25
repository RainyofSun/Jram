//
//  NSArray+Access.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SafeAccess)
/**
 安全取数组方式，不会引数组越界抛异常
 
 注：特定情况下使用，不应过度依赖此方法而不考虑数组越界情况
 
 @param index index
 @return object or nil
 */
- (nullable id)safe_objectAtIndex:(NSUInteger)index;
/**
 返回一个去除了重复元素的数组
 
 @return 去除重复元素的新数组
 */
- (nonnull NSArray *)unique;                /* 去重 */
/**
 返回反序后的数组
 
 @return 反序数组
 */
- (nonnull NSArray *)reversedArray;         /* 反转 */
/**
 取数组最后 index 个数量的对象，以新数组返回
 
 如果 index >= 原数组的元素个数，则返回原数组
 
 @param index 数量
 @return 新数组
 */
- (nonnull NSArray *)subarrayFromIndex:(NSUInteger)index;

/** 移除第一个对象 */
- (NSArray *)removeFirstObject;

/** 移除最后一个对象 */
- (NSArray *)removeLastObject;

- (id)mtSafeObjectAtIndex:(NSUInteger)index;

+ (instancetype)mtSafeArrayWithObject:(id)object;

- (NSArray *)mtSafeSubarrayWithRange:(NSRange)range;

- (NSUInteger)mtSafeIndexOfObject:(id)anObject;




- (NSString*)hm_stringWithIndex:(NSUInteger)index;

- (NSNumber*)hm_numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *)hm_decimalNumberWithIndex:(NSUInteger)index;

- (NSArray*)hm_arrayWithIndex:(NSUInteger)index;

- (NSDictionary*)hm_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)hm_integerWithIndex:(NSUInteger)index;

- (NSUInteger)hm_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)hm_boolWithIndex:(NSUInteger)index;

- (int16_t)hm_int16WithIndex:(NSUInteger)index;

- (int32_t)hm_int32WithIndex:(NSUInteger)index;

- (int64_t)hm_int64WithIndex:(NSUInteger)index;

- (char)hm_charWithIndex:(NSUInteger)index;

- (short)hm_shortWithIndex:(NSUInteger)index;

- (float)hm_floatWithIndex:(NSUInteger)index;

- (double)hm_doubleWithIndex:(NSUInteger)index;

- (NSDate *)hm_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)hm_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)hm_pointWithIndex:(NSUInteger)index;

- (CGSize)hm_sizeWithIndex:(NSUInteger)index;

- (CGRect)hm_rectWithIndex:(NSUInteger)index;

@end
NS_ASSUME_NONNULL_END

