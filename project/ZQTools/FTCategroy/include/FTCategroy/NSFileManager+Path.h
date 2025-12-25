//
//  NSFileManager+Path.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Path)
#pragma mark *** 基础方法 ***

+ (BOOL)isDirectory:(NSString *)filePath;
+ (BOOL)existFile:(NSString *)filePath;

/*
 *  以下三个方法是对路径的截取操作，返回对应的文件名、后缀、所在文件夹路径
 */
+ (NSString *)fileNameForPath:(NSString *)path;
+ (NSString *)fileExtensionWithDotForPath:(NSString *)path;
+ (NSString *)filePathForPath:(NSString *)path;                     /* 所在文件夹路径 */


+ (NSNumber *)fileSizeWithFilePath:(NSString *)filePath;

+ (NSArray <NSString *> *)fileNamesInFolder:(NSString *)path;       /* 文件夹下所有文件 */

#pragma mark *** Path相关 ***
/*
 *  以下五个方法返回对应沙盒文件相关路径
 */
+ (NSString *)documentsPath;
+ (NSString *)libraryPath;
+ (NSString *)temporaryPath;
+ (NSString *)bundlePath;
+ (NSString *)documentFilePathWithFileName:(NSString *)fileName;
+ (NSString *)bundleFilePathWithFileName:(NSString *)fileName;

@end
