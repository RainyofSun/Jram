//
//  NSNumber+Utility.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Utility)
/*
 返回位数
 */
+ (NSInteger)digitOfNumber:(NSInteger)number;
/**
 *转为字符串
 */
- (NSString *)formatNumberDecimal;

@end
