//
//  AppDelegate.h
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import <UIKit/UIKit.h>
#import "BaseTabbarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) BaseTabbarViewController *m_mainVc;
@property (strong, nonatomic) UIWindow *window;

- (void)locationStart;

@end

