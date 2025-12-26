//
//  NsnwBaseNswjViewhsViewController.m
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import "NsnwBaseNswjViewhsViewController.h"

@interface NsnwBaseNswjViewhsViewController ()

@end

@implementation NsnwBaseNswjViewhsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count == 0){
        return [super pushViewController:viewController animated:animated];
    }else if (self.viewControllers.count>=1) {
        viewController.hidesBottomBarWhenPushed = YES;//隐藏二级页面的tabbar
    }
    [super pushViewController:viewController animated:animated];
    // 修改tabBra的frame(适配iphoneX的tabbar适配)
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
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
