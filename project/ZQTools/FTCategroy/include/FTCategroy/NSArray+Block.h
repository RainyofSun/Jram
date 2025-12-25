//
//  NSArray+BAFBlock.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Block)
/**
 返回一个通过传入闭包处理映射后的新数组， 如果映射后为 nil，则以 NSNull 填充。
 
 比如：
 
 NSArray *array = @[@1, @2, nil];
 
 array = [array map: ^id _Nonnull(id _Nonnull object) {
 
 return object ? [object description] : nil;
 
 }];
 
 array 变为 @[@"1", @"2", NSNull]
 
 @param block 映射闭包
 @return 新数组
 */
- (nonnull NSArray *)mappedArrayUsingBlock:(id _Nonnull (NS_NOESCAPE ^_Nonnull)(id _Nonnull object))block;
/**
 返回一个经过传入闭包处理映射后的新数组， 如果映射后为 nil，则忽略
 
 比如：
 
 NSArray *array = @[@1, @2, nil];
 
 array = [array map: ^id _Nonnull(id _Nonnull object) {
 
 return object ? [object description] : nil;
 
 }];
 
 array 变为 @[@"1", @"2"]
 
 @param block 映射闭包
 @return 新数组
 */
- (nonnull NSArray *)flatMappedArrayUsingBlock:(id _Nonnull (NS_NOESCAPE ^_Nonnull)(id _Nonnull object))block;
/**
 返回一个经过传入闭包处理筛选后的新数组
 
 比如：
 
 NSArray *array = @[@1, @2, @"3"];
 
 array = [array filter:^BOOL(id  _Nonnull object) {
 
 return [object isKindOfClass: [NSNumber class]];
 
 }];
 
 array 变为 @[@1, @2]
 
 @param block 筛选闭包
 @return 新数组
 */
- (nonnull NSArray *)filteredArrayUsingBlock:(BOOL (NS_NOESCAPE ^ _Nonnull)(id _Nonnull object))block;
/**
 给定一个初始值，遍历数组，通过闭包处理后返回结果
 
 比如：
 
 NSArray *array = @[@1, @2, @3];
 
 NSNumber *ret = [array reduce: @0
 
 withBlock:^id _Nonnull(id  _Nonnull accumulator, id  _Nonnull object) {
 
 return @([accumulator integerValue] + [object integerValue]);
 
 }];
 
 ret 为 @6
 
 @param buinitial 初始值
 @param block 处理播报
 @return 新值
 */
- (nonnull id)reduce:(nullable id)buinitial usingBlock:(id _Nonnull (NS_NOESCAPE ^_Nonnull)(id _Nonnull accumulator, id _Nonnull object))block;

/** 遍历数组 index 和 object */
- (NSArray *)arrayWithIndexMapBlock:(id (^)(NSUInteger index, id object))block;

/** 数组过滤器 */
- (NSArray *)filterBlock:(BOOL (^)(id object))block;

/** 数组剔除器 */
- (NSArray *)reversePickWithArray:(NSArray *)array;

@end
NS_ASSUME_NONNULL_END
