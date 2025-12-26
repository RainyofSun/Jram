//
//  NSJSONSerialization+SafeData.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (SafeData)

/* 安全将数据流转成JSON对象的方法
 * @param data 数据流
 * @param opt NSJSONReadingOptions 选项
 * @param error 错误
 * @return json对象
 */
+ (id)JSONObjectWithSafeData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError **)error;
@end
