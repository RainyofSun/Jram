//
//  AppDelegate.h
//  project
//
//  Created by 周群 on 2021/9/26.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic)MainTabViewController *m_mainVc;
@property (strong, nonatomic) UIWindow *window;

- (void)locationStart;

@end

