//
//  AuthenticationPublicTipViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "AuthenticationPublicTipViewController.h"

@interface AuthenticationPublicTipViewController ()

@end

@implementation AuthenticationPublicTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColorFromRGB(MainText0Color) colorWithAlphaComponent:0.5];
    
    UIImageView *centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 335)/2, (kSCREEN_HEIGHT - 480)/2 - 20, 335, 480)];
    centerImageView.image = OSLWImage(@"Detail_tip_down_Image");
    [self.view addSubview:centerImageView];
    if (self.m_isCardBool) {
        centerImageView.image = OSLWImage(@"Detail_tip_up_Image");
    }
    
    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setImage:OSLWImage(@"Center_cancel_Image") forState:UIControlStateNormal];
    WEAK_SELF
    [cancelBtn addTapAction:^(UIGestureRecognizer *sender) {
        STRONG_SELF
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    [self.view addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(32);
        make.bottom.equalTo(centerImageView.mas_top).offset(0);
        make.right.equalTo(centerImageView.mas_right).offset(8);
    }];
    
    UIButton *confirmBtn = [UIButton new];
    [confirmBtn setBackgroundImage:OSLWImage(@"login_btn_back_Image") forState:UIControlStateNormal];
    [confirmBtn setTitle:@"Next" forState:UIControlStateNormal];
    [confirmBtn.titleLabel setFont:OSLWBoldFont(20)];
    [confirmBtn addTarget:self action:@selector(serviceloginlogout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(247);
        make.height.mas_equalTo(54);
        make.top.equalTo(centerImageView.mas_bottom).offset(15);
        make.centerX.equalTo(centerImageView);
    }];
}

- (void)serviceloginlogout
{
    WEAK_SELF
    [self dismissViewControllerAnimated:NO completion:^{
        STRONG_SELF
        if (self.block) {
            self.block();
        }
    }];
}

@end
