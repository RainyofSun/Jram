//
//  UITextView+Height.h
//  Moments
//
//  Created by jiangzhichao on 4/22/16.
//  Copyright © 2016 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Height)

/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (CGFloat)heightLimitWidth:(CGFloat)width;
//同上
- (CGFloat)heightWithMaxWidth:(CGFloat)width;

@end
