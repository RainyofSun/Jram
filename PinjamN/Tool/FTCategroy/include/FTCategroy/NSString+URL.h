//
//  NSString+URLFilter.h
//  Moments
//
//  Created by 魏雷 on 15/11/2.
//  Copyright © 2015年 jiangzhichao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)
/// nil 标识是小树图标
/// self 标识不是小树图标
- (NSString *)getValidHeadImageUrl;
/**
 字符串转换成NSURL对象
 */
- (NSURL *)toURL;

/**
 *  @return If the receiver is a valid URL query component, returns
 *  components as key/value pairs. If couldn't split into *any* pairs,
 *  returns nil.
 */
- (NSDictionary*)URLQueryDictionary;
@end
