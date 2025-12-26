//
//  UIView+Gesture.h
//  BAFCategories
//
//  Created by jackiehoo on 19/10/2017.
//

#import <UIKit/UIKit.h>
#import "UIGestureRecognizer+Blocks.h"

@interface UIView (Gesture)

/*
 *  以下属性方法是针对手势的相关设置， 没有处理依赖关系 ， 关闭键盘是用 endEditing： 来实现的
*/

/**
*  单击手势
*
*/
@property (nonatomic, strong, readonly, nullable)  UITapGestureRecognizer *bb_tapGesture;
/**
 *  双击手势
 *
 */
@property (nonatomic, strong, readonly, nullable)  UITapGestureRecognizer *bb_doubleTapGesture;
/**
 *  长按手势
 *
 */
@property (nonatomic, strong, readonly, nullable)  UILongPressGestureRecognizer *bb_longPressGesture;
/**
 *  关闭键盘手势
 *
 */
@property (nonatomic, strong, readonly, nullable)  UITapGestureRecognizer *bb_closingKeyboardGesture;
/**
 *  添加单击手势
 *
 */
- (nonnull UITapGestureRecognizer *)addTapAction:(nonnull BBGestureActionBlock) actionBlock;
/**
 *  添加双击手势
 *
 */
- (nonnull UITapGestureRecognizer *)addDoubleTapAction:(nonnull BBGestureActionBlock) actionBlock;
/**
 *  添加长按手势
 *
 */
- (nonnull UILongPressGestureRecognizer *)addLongPressAction:(nonnull BBGestureActionBlock) actionBlock;
/**
 *  添加关闭键盘手势  默认事件是 [self endEditing：YES]
 *
 */
- (nonnull UITapGestureRecognizer *)addTapActionForClosingKeyboard;

@end
