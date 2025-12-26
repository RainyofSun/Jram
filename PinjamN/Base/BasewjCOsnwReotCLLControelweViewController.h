//
//  BasewjCOsnwReotCLLControelweViewController.h
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import <UIKit/UIKit.h>
#import "CbsaBasnwmanBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface BasewjCOsnwReotCLLControelweViewController : UIViewController

@property (nonatomic, strong) CbsaBasnwmanBar *huNavigationBar;

/**
 用了自定义的手势返回，则系统的手势返回屏蔽
 不用自定义的手势返回，则系统的手势返回启用
 这个功能暂未实现，e可通过设置fd_interactivePopDisabled  属性来屏蔽
 */
@property (nonatomic, assign) BOOL enablePanGesture;//是否支持自定义拖动pop手势，默认yes,支持手势

//@property (nonatomic,retain) MBProgressHUD* hud;
//- (void)addHud;
//- (void)addHudWithMessage:(NSString*)message;
//- (void)removeHud;


/**
 *  Title
 */
@property (nonatomic, copy) NSString *xuTitle;

@property (nonatomic, copy) NSString *lTitle;

@property (nonatomic, copy) NSString *rTitle;


- (void)initNavigationBar;
- (void)initNavigationBarWithTitle:(NSString *)title;
- (void)initNaviBarWithTitle:(NSString *)title LeOSLWImage:(UIImage*)lImage leftTitle:(NSString* )lTitle rightImage:(UIImage*)rImage rightTitle:(NSString*)rTitle delegate:(id <HUNavigationBarDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
