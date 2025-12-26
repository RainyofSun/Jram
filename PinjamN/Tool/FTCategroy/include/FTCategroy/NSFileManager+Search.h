//
//  NSFileManager+Search.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Search)
#pragma mark *** Search相关 ***
/**
 寻找指定目录下的指定文件
 会深度遍历所有子文件直到找到第一个匹配的文件
 
 @return 文件完整路径
 */
+ (NSString *)searchFileWithFileName:(NSString *)fileName inFolder:(NSString *)path;
/**
 返回Documents目录下所有匹配后缀名的文件路径
 深度搜索，大小写不敏感
 
 @return 所有匹配后缀名的文件路径
 */
+ (NSArray <NSString *> *)pathsForDocumentsMatchingExtension:(NSString *)ext;
/**
 返回 Main Bundle 下所有匹配后缀名的文件路径
 深度搜索，大小写不敏感
 
 */
+ (NSArray <NSString *> *)pathsForBundleDocumentsMatchingExtension:(NSString *)ext;
@end
