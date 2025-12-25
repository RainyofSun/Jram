//
//  NSFileManager+Operation.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Operation)
/**
 创建目录
 
 */
+ (BOOL)createDirectoryIfNotExist:(NSString *)filePath;
/**
 删除 Document 目录下文件
 
 */
+ (BOOL)deleteFileForPath:(NSString *)path;
/**
 生成一个命名唯一的临时目录下的文件
 
 */
+ (NSString *)generateAUniqueTemporaryFilePath;

@end
