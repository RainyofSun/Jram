//
//  BaseViewController.h
//  baoguan
//
//  Created by 周群 on 2018/5/10.
//  Copyright © 2018年 周群. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUNavigationBar.h"
@interface BaseViewController : UIViewController<HUNavigationBarDelegate>
@property (nonatomic, strong) HUNavigationBar *huNavigationBar;

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
- (void)initNaviBarWithTitle:(NSString *)title LeftImage:(UIImage*)lImage leftTitle:(NSString* )lTitle rightImage:(UIImage*)rImage rightTitle:(NSString*)rTitle delegate:(id <HUNavigationBarDelegate>)delegate;
@end
