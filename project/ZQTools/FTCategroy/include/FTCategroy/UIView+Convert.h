//
//  UIView+Convert.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIView (Convert)

/*
 *  快速初始化方法
 */
- (nonnull UIView *)initWithSize:(CGSize)size;

/*
 *  下面6个方法是对center的相关操作
 */
- (void)convertCenterToCenterInRect:(CGRect)rect;
- (void)convertCenterToCenterInRect:(CGRect)rect offset:(UIOffset )offset;  //use UIOffsetMake

- (void)convertCenterToSuperViewCenter;
- (void)convertCenterToSuperViewCenterWithOffset:(UIOffset )offset;

- (void)convertCenterXToSuperViewCenterX;
- (void)convertCenterYToSuperViewCenterY;

@end
