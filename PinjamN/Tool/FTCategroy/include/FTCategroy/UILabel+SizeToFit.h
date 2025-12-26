//
//  UILabel+SizeToFit.h
//  YueWan
//
//  Created by jiangzhichao on 15/9/21.
//  Copyright (c) 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SizeToFit)

@property (nonatomic, assign) CGFloat labelLineSpacing;

- (void)sizeToFitWithMaxWidth:(CGFloat)maxWidth;

- (CGSize)calculateLabelSize;

@end
