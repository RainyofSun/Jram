//
//  UIAlertView+Show.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>
#define BB_COMMON_ALERT_VIEW_OK_BUTTON_TITLE @"确定"          /* 默认显示的文案 */
#define BB_COMMON_ALERT_VIEW_CANCEL_BUTTON_TITLE @"取消"



/*
 *  兼容AlertController iOS8以后走AlertController。  回调的 Block里 UIAlertView 是 nil， 如有特殊需要，用UIAlertController + Common
 */

typedef void (^BBAlertClickedButtonBlock)(UIAlertView * _Nullable alertView, NSUInteger buttonIndex);

@interface UIAlertView (Show)
#pragma mark - ** Block相关 **

@property (nonatomic, copy, nonnull) BBAlertClickedButtonBlock  bb_clickedButtonBlock;           /* 点击按钮的回调 */


/*
 * 下面3个方法，无title 只有message。默认是取消、确定按钮都出现。 没有Block回调
 */
+ (nonnull UIAlertView *)showWithMessage:(nullable NSString *)message;
+ (nonnull UIAlertView *)showOkWithMessage:(nullable NSString *)message;
+ (nonnull UIAlertView *)showCancelWithMessage:(nullable NSString *)message;


/*
 * 下面3个方法，有title 有message。默认是取消、确定按钮都出现。 没有Block回调
 */
+ (nonnull UIAlertView *)showWithTitle:(nullable NSString *)title message:(nullable NSString *)message;
+ (nonnull UIAlertView *)showOkWithTitle:(nullable NSString *)title message:(nullable NSString *)message;
+ (nonnull UIAlertView *)showCancelWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

/*
 * 下面3个方法，有title 有message。默认是取消、确定按钮都出现。 有Block回调
 */
+ (nonnull UIAlertView *)showWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message
                                 block:(nullable BBAlertClickedButtonBlock)block;
+ (nonnull UIAlertView *)showOkWithTitle:(nullable NSString *)title
                                 message:(nullable NSString *)message
                                   block:(nullable BBAlertClickedButtonBlock)block;
+ (nonnull UIAlertView *)showCancelWithTitle:(nullable NSString *)title
                                     message:(nullable NSString *)message
                                       block:(nullable BBAlertClickedButtonBlock)block;

/*
 * 同上根据传入参数判断取舍
 */
+ (nonnull UIAlertView *)showWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message
                                 block:(nullable BBAlertClickedButtonBlock)block
                     cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                          buttonTitles:(nullable NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;


#pragma mark - ** 兼容AlertController（传入VC） **
/*
 *  iOS8以前用的是UIAlertView， 8以后这个方法用的是AlertController   block的Index是UIAlertView的Index（左边第一个是0，向右依次递增）
 */
+ (nonnull UIAlertView *)showAlertControllerWithTitle:(nullable NSString *)title
                                              message:(nullable NSString *)message
                                     inViewController:(nonnull UIViewController *)viewController
                                    cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                                         buttonTitles:(nullable NSArray<NSString *> *)otherButtonTitles
                                                block:(nullable BBAlertClickedButtonBlock)block;
@end
