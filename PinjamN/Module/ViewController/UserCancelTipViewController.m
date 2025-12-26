//
//  UserCancelTipViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "UserCancelTipViewController.h"

@interface UserCancelTipViewController ()

@property (nonatomic, strong)UIImageView         *s_centerView;

@end

@implementation UserCancelTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
}

- (void)addSubViews
{
    WEAK_SELF
    self.view.backgroundColor = [UIColorFromRGB(MainText0Color) colorWithAlphaComponent:0.5];
    self.s_centerView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 335)/2, (kSCREEN_HEIGHT - 525)/2 - 20, 335, 525)];
    self.s_centerView.image = OSLWImage(@"Center_aaaaa_Image");
    [self.view addSubview:self.s_centerView];
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 31, self.s_centerView.width, 25)];
    titLabel.text = @"Loan Agreement";
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.font = OSLWMediumFont(18);
    titLabel.textColor = UIColorFromRGB(MainText3Color);
    [self.s_centerView addSubview:titLabel];
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 70, self.s_centerView.width - 80, 414)];
    descLabel.text = @"MabilisPera App is a professional personal credit loan application that can provide users with up to 80000 yuan in funding services with simple information. We have provided financial services to over one million users, helping them solve various financial problems.Rapid Lend App is a professional personal credit loan application that can provide users with up to 80000 yuan in funding services with simple information. We have provided financial services to over one million users, helping them solve various financial problems.";
    descLabel.textAlignment = NSTextAlignmentCenter;
    descLabel.font = OSLWRegularFont(16);
    descLabel.numberOfLines = 0;
    descLabel.textColor = UIColorFromRGB(MainText3Color);
    [self.s_centerView addSubview:descLabel];
    
    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setImage:OSLWImage(@"Center_cancel_Image") forState:UIControlStateNormal];
    [cancelBtn addTapAction:^(UIGestureRecognizer *sender) {
        STRONG_SELF
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    [self.view addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(32);
        make.bottom.equalTo(self.s_centerView.mas_top).offset(0);
        make.right.equalTo(self.s_centerView.mas_right).offset(8);
    }];
    
    UIButton *confirmBtn = [UIButton new];
    [confirmBtn setBackgroundImage:OSLWImage(@"login_btn_back_Image") forState:UIControlStateNormal];
    [confirmBtn setTitle:@"Agree and Continue" forState:UIControlStateNormal];
    [confirmBtn.titleLabel setFont:OSLWBoldFont(20)];
    [confirmBtn addTarget:self action:@selector(serviceloginlogout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(247);
        make.height.mas_equalTo(54);
        make.top.equalTo(self.s_centerView.mas_bottom).offset(15);
        make.centerX.equalTo(self.s_centerView);
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
