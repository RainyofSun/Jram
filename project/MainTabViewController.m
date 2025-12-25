//
//  MainTabViewController.m
//  股票18
//
//  Created by 周群 on 2019/7/13.
//  Copyright © 2019 周群. All rights reserved.
//

#import "MainTabViewController.h"
#import "FBBaseNavigationController.h"
#import "FTHomeVC.h"
#import "FTOrderVC.h"
#import "FTCenterVC.h"
#import "FTLoginVC.h"

@interface MainTabViewController ()<UITabBarControllerDelegate>
@property (nonatomic, strong)FTOrderVC *s_vc;

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [FT_Notification addObserver:self selector:@selector(changeTabAction:) name:MainIndex object:nil];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, TabBarHeight)];
    backView.backgroundColor = UIColorFromRGB(MainWhiteColor);
    backView.layer.shadowColor = [UIColor colorWithRed:12/255.0 green:150/255.0 blue:84/255.0 alpha:0.0300].CGColor;;
    backView.layer.shadowOffset = CGSizeMake(0, -3);
    backView.layer.shadowOpacity = 1;
    backView.layer.shadowRadius = 4;
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    FBBaseNavigationController *rootNav1 = [[FBBaseNavigationController alloc] initWithRootViewController:[FTHomeVC new]];
    rootNav1.tabBarItem = [rootNav1.tabBarItem initWithTitle:nil image:[[UIImage imageNamed:@"tab11"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab12"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.s_vc = [FTOrderVC new];
    FBBaseNavigationController *rootNav2 = [[FBBaseNavigationController alloc] initWithRootViewController:self.s_vc];
    rootNav2.tabBarItem = [rootNav2.tabBarItem initWithTitle:nil image:[[UIImage imageNamed:@"tab21"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab22"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
    FBBaseNavigationController *rootNav3 = [[FBBaseNavigationController alloc] initWithRootViewController:[FTCenterVC new]];
    rootNav3.tabBarItem = [rootNav3.tabBarItem initWithTitle:nil image:[[UIImage imageNamed:@"tab31"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab32"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
  

    [UITabBar appearance].translucent = NO;
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    self.viewControllers = @[rootNav1,rootNav2,rootNav3];
    //运行后默认选择tab几
    self.selectedViewController = [self.viewControllers objectAtIndex:0];
    
    //去除系统默认的线
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColorFromRGB(MainWhiteColor) CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];

}

- (void)changeTabAction:(NSNotification *)object
{
    NSDictionary *dic = (NSDictionary *)[object object];
    self.selectedViewController = [self.viewControllers objectAtIndex:1];
    [self.s_vc configWithStr:[dic stringForKey:@"index"]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSArray *arr = self.tabBar.subviews;
    UIView *firstView = arr.firstObject;
    NSArray *subViews = firstView.subviews;
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)view;
            [imageView removeFromSuperview];
        }
    }
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (![FT_Defaults stringForKey:MainToken]) {
        FTLoginVC *vc = [FTLoginVC new];
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:nc animated:YES completion:nil];
        return NO;
    }
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
