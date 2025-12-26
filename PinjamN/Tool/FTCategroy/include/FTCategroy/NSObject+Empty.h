//
//  NSObject+Empty.h
//  YueWanTest
//
//  Created by jiangzhichao on 15/7/27.
//  Copyright (c) 2015年 jiangzhichao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Empty)

- (BOOL)isNotEmpty;
- (BOOL)isNotEmptyDictionary;
/**
 判断是否有内容，对于一般的对象，等效于 isNotNull，
 对于 NSString, NSArray, NSDictionary 这些，会根据
 .length 或者 .count 来进一步判断是否又内容
 
 @return YES or NO
 */
- (BOOL)hasContent;
/**
 判断是否为 Dictionary 并且内容
 
 @return YES or NO
 */
- (BOOL)isDictionaryAndHasEntries;

- (BOOL)hasTextContent;
@end
