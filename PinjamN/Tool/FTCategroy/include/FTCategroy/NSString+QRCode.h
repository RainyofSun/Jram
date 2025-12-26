//
//  NSString+QRCode.h
//  pregnancy
//
//  Created by Babytree on 2017/7/18.
//  Copyright © 2017年 babytree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (QRCode)
// 根据字符串生成二维码图片
- (UIImage *)createQRCodeImage;

/** 生成二维码(中间有小图片)
* @param centerImage 二维码中间的image对象
* @return 返回二维码图片
 */
- (UIImage *)createImgQRCodeWithCenterImage:(UIImage *)centerImage;
@end
