//
//  NSURL+Utility.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSURL (Utility)
/**
 URL 字符数
 
 @return URL 字符数
 */
@property (readonly, nonatomic) NSUInteger length;
/**
 判断是否相等，参考做法 http://vgable.com/blog/2009/04/22/nsurl-isequal-gotcha/
 
 @param otherURL otherURL
 @return YES or NO
 */
- (BOOL)isEqualToURL:(NSURL *)otherURL;

@end
