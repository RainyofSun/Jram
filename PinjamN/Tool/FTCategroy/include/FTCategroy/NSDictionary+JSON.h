//
//  NSDictionary+JSON.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)
/**
 返回 JSON 序列化后的字符串
 
 @return JSON 序列化后的字符串
 */
- (NSString *)JSONString;
@end
