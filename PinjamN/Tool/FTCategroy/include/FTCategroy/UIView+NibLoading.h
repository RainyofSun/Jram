//
//  UIView+NibLoading.h
//  Moments
//
//  Created by 孙帆 on 15/11/9.
//  Copyright © 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NibLoading)

+ (id)instanceWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)bundleOrNil owner:(id)owner;
- (void)loadContentsWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)bundleOrNil;

@end
