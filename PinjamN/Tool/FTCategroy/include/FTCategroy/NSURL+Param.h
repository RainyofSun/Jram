//
//  NSDictionary+Param.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSURL (Param)
/**
 *  @brief  url参数转字典
 *
 *  @return 参数转字典结果
 */
- (NSDictionary *)parameters;
/**
 *  @brief  根据参数名 取参数值
 *
 *  @param parameterKey 参数名的key
 *
 *  @return 参数值
 */
- (NSString *)valueForParameter:(NSString *)parameterKey;
/**
 通过 key，找到 query 的值
 
 @param key key
 @return value or nil if not found
 */
- (NSString *)queryArgumentForKey:(NSString *)key;
- (NSString *)queryArgumentForKey:(NSString *)key withDelimiter:(NSString *)delimiter;

+(NSDictionary<NSString *, NSString *> *)queryParametersFromURL:(NSURL *)url;

@end
