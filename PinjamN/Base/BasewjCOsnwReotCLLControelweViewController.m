//
//  BasewjCOsnwReotCLLControelweViewController.m
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import "BasewjCOsnwReotCLLControelweViewController.h"

@interface BasewjCOsnwReotCLLControelweViewController ()

@end

@implementation BasewjCOsnwReotCLLControelweViewController

- (id)init{
    self = [super init];
    if (self) {
        self.enablePanGesture = YES;
    }
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xFEFFED);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.fd_prefersNavigationBarHidden = YES;
    [OSLW_Notification postNotificationName:MainNotification object:nil];

}

#pragma mark - 自定义navibar
- (void)initNaviBarWithTitle:(NSString *)title LeftImage:(UIImage*)lImage leftTitle:(NSString* )lTitle rightImage:(UIImage*)rImage rightTitle:(NSString*)rTitle delegate:(id <HUNavigationBarDelegate >)delegate {
    
    _huNavigationBar = [[CbsaBasnwmanBar alloc] initNaviBarWithTitle:title LeftImage:lImage leftTitle:lTitle rightImage:rImage rightTitle:rTitle delegate:delegate frame:CGRectMake(0, 0, kSCREEN_WIDTH, NavBarHeight)];

    [self.view addSubview:_huNavigationBar];

}

- (void)initNavigationBarWithTitle:(NSString *)title {
    [self initNaviBarWithTitle:title LeftImage:nil leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
}

- (void)initNavigationBar{
    [self initNaviBarWithTitle:nil LeftImage:[UIImage imageNamed:@"icon_arrow_left"] leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
}

- (void)setXuTitle:(NSString *)xuTitle {
    if (xuTitle) {
        _huNavigationBar.m_titleLabel.text = xuTitle;
    }
}

- (void)setLTitle:(NSString *)lTitle {
    if (lTitle) {
        [_huNavigationBar.m_leftBtn setTitle:lTitle forState:UIControlStateNormal];
    }
}

- (void)leftAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightAction {
    
}

@end
