//
//  UIView+Responder.h
//  BAFCategories
//
//  Created by jackiehoo on 19/10/2017.
//

#import <UIKit/UIKit.h>

@interface UIView (Responder)
/**
 *  找到 first responder 的View
 *
 */
- (nullable UIView *)firstResponder;
/**
 *  设置视图层级，所有子视图的exclusiveTouch属性，包括子视图所有的subview
 *
 */
- (void)setAllButtonsExclusiveTouch:(BOOL)exclusiveTouch;

/**
 *  设置视图层级，所有子视图的exclusiveTouch属性，包括子视图所有的subview
 *
 */
- (void)setAllSubviewsExclusiveTouch:(BOOL)exclusiveTouch;

@end
