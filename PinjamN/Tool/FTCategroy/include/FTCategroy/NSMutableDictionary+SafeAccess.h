//
//  NSMutableDictionary+SafeAccess.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (SafeAccess)
/**
 安全写入数据，会检查 value 和 key 是否为空，key 会检查是否为空字符串，如果是，则不写入
 
 @param object 值
 @param key key
 */
- (void)safe_setObject:(id)object forKey:(NSString *)key;
/**
 尝试写入对象，如果为 nil，则写入空字符串，会检查key，如果key为nil，则不写入
 
 @param obj 值
 @param key key
 */
- (void)setObjectWithEmptyStringPlaceholder:(id)obj forKey:(NSString *)key;

-(void)setObj:(id)value forKey:(NSString*)key;

-(void)setString:(NSString*)value forKey:(NSString*)key;

- (void)setString:(NSString *)value defaultString:(NSString *)defaultString forKey:(NSString *)key;
/**
 以 NSNumber 形式写入 BOOL
 
 @param value BOOL
 @param key key
 */
-(void)setBool:(BOOL)value forKey:(NSString*)key;
/**
 以 NSNumber 形式写入 int
 
 @param value NSInteger
 @param key key
 */
-(void)setInt:(int)value forKey:(NSString*)key;
/**
 以 NSNumber 形式写入 NSInteger
 
 @param value NSInteger
 @param key key
 */
-(void)setInteger:(NSInteger)value forKey:(NSString*)key;

-(void)setUnsignedInteger:(NSUInteger)value forKey:(NSString*)key;

-(void)setCGFloat:(CGFloat)value forKey:(NSString*)key;

-(void)setChar:(char)value forKey:(NSString*)key;
/**
 以 NSNumber 形式写入 float
 
 @param value float
 @param key key
 */
-(void)setFloat:(float)value forKey:(NSString*)key;
/**
 以 NSNumber 形式写入 double
 
 @param value double
 @param key key
 */
-(void)setDouble:(double)value forKey:(NSString*)key;

-(void)setLongLong:(long long)value forKey:(NSString*)key;
/**
 以 DictionaryRepresentation 形式写入 CGPoint
 
 @param value CGPoint
 @param key key
 */
-(void)setPoint:(CGPoint)value forKey:(NSString*)key;
/**
 以 DictionaryRepresentation 形式写入 CGSize
 
 @param value CGSize
 @param key key
 */
-(void)setSize:(CGSize)value forKey:(NSString*)key;
/**
 以 DictionaryRepresentation 形式写入 CGRect
 
 @param value CGRect
 @param key key
 */
-(void)setRect:(CGRect)value forKey:(NSString*)key;
@end
