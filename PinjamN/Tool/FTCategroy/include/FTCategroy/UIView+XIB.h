//
//  UIView+XIB.h
//  BAFCategories
//
//  Created by jackiehoo on 19/10/2017.
//

#import <UIKit/UIKit.h>

@interface UIView (XIB)
/**
 * 由xib文件来创建View
 * xib名称为:className.xib
 */
+ (nonnull UIView *)createWithXib;
/**
 *
 *  由xib文件来创建View
 *  xibName:执行的xib文件名称
 *
 */
+ (nonnull UIView *)createWithXibName:(nonnull NSString *)xibName;

@end
