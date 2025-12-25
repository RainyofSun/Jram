//
//  NSDictionary+Block.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Block)
/**
 遍历字典，以键值对形式传入参数
 
 @param block block
 */
- (void)each:(void (^)(id key, id value))block;
/**
 遍历字典key
 
 @param block block
 */
- (void)eachKey:(void (^)(id key))block;
/**
 遍历字典value
 
 @param block block
 */
- (void)eachValue:(void (^)(id value))block;
/**
 遍历字典，返回映射处理后的数组
 
 @param block 映射处理闭包
 @return 映射后的数组
 
 */
- (NSArray *)map:(id (^)(id key, id value))block;
@end
