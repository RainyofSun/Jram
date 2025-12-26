//
//  UIImage+Save.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImage (Save)
/**
 写入指定路径，如果是 jpeg，则以最高质量存储
 
 @param aPath 路径
 @return YES 成功，NO 失败
 */
- (BOOL)saveImageToLocalPath:(NSString*)aPath;
/**
 写入指定路径
 
 @param aPath 路径
 @param quality 如果是 jpeg 图片的话，使用的压缩质量
 @return YES 成功，NO 失败
 */
- (BOOL)saveImageToLocalPath:(NSString*)aPath withJpegQuality:(CGFloat)quality;
@end
