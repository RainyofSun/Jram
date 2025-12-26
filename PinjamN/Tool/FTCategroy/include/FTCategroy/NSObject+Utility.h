//
//  NSObject+Utility.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Utility)
/**
 判断是否为 NSNull 或 nil
 
 @return YES or No
 */
- (BOOL)isValided;
/*
 *  以下方法是根据OC的消息转发机制，容错处理避免找不到方法崩溃    
 *      warning! 对应BAFCategories中Dictionary的所有解析方法。对应删减
 */
- (NSString *)stringForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (id)valueForUndefinedKey:(NSString *)key;


- (BOOL)hasKey:(NSString *)key;
- (NSString*)stringForKey:(id)key defaultValue:(NSString *)defaultValue;
- (NSString*)stringForKey:(id)key defaultString:(NSString *)defaultValue;

- (NSNumber*)numberForKey:(id)key;
- (NSDecimalNumber *)decimalNumberForKey:(id)key;
- (NSInteger)integerForKey:(id)key;

- (NSUInteger)unsignedIntegerForKey:(id)key;
- (BOOL)boolForKey:(id)key;
- (int16_t)int16ForKey:(id)key;
- (int32_t)int32ForKey:(id)key;
- (int64_t)int64ForKey:(id)key;
- (char)charForKey:(id)key;
- (short)shortForKey:(id)key;
- (float)floatForKey:(id)key;
- (double)doubleForKey:(id)key;
- (long long)longForKey:(NSString *)key;
- (long long)longLongForKey:(id)key;
- (unsigned long long)unsignedLongLongForKey:(id)key;
- (NSDate *)dateForKey:(id)key dateFormat:(NSString *)dateFormat;
- (CGFloat)CGFloatForKey:(id)key;
- (CGPoint)pointForKey:(id)key;
- (CGSize)sizeForKey:(id)key;
- (CGRect)rectForKey:(id)key;




@end

