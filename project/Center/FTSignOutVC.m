//
//  FTSignOutVC.m
//  project
//
//  Created by 周群 on 2024/8/3.
//

#import "FTSignOutVC.h"

@interface FTSignOutVC ()
@property (nonatomic, strong)UIImageView         *s_centerView;

@end

@implementation FTSignOutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
}

- (void)addSubViews
{
    WEAK_SELF
    self.view.backgroundColor = [UIColorFromRGB(MainText0Color) colorWithAlphaComponent:0.5];
    self.s_centerView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 335)/2, (kSCREEN_HEIGHT - 211)/2 - 20, 335, 211)];
    self.s_centerView.image = FTImage(@"Center_Signout_Image");
    [self.view addSubview:self.s_centerView];
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 31, self.s_centerView.width, 25)];
    titLabel.text = @"Sign out";
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.font = FTMediumFont(18);
    titLabel.textColor = UIColorFromRGB(MainText3Color);
    [self.s_centerView addSubview:titLabel];
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, self.s_centerView.width, 50)];
    descLabel.text = @"Are you sure you want to logout\nthis application?";
    descLabel.textAlignment = NSTextAlignmentCenter;
    descLabel.font = FTRegularFont(16);
    descLabel.numberOfLines = 0;
    descLabel.textColor = UIColorFromRGB(MainText3Color);
    [self.s_centerView addSubview:descLabel];
    
    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setImage:FTImage(@"Center_cancel_Image") forState:UIControlStateNormal];
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
    [confirmBtn setBackgroundImage:FTImage(@"login_btn_back_Image") forState:UIControlStateNormal];
    [confirmBtn setTitle:@"Confirm" forState:UIControlStateNormal];
    [confirmBtn.titleLabel setFont:FTBoldFont(20)];
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
    [SVProgressHUD show];
    [FTNetting getWithURLServiceString:serviceloginlogout parameters:nil success:^(FTResponseModel *model) {
        if(model.success){
            [SVProgressHUD dismiss];
            [FTCommonObject loginAction];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
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
