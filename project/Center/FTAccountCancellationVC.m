//
//  FTAccountCancellationVC.m
//  project
//
//  Created by 周群 on 2024/8/3.
//

#import "FTAccountCancellationVC.h"
#import "FTAccountCancellationTipVC.h"

@interface FTAccountCancellationVC ()
@property (nonatomic, strong)UIImageView  *s_centerView;
@property (nonatomic, strong)UIButton     *s_tipBtn;

@end

@implementation FTAccountCancellationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
}

- (void)addSubViews
{
    WEAK_SELF
    self.view.backgroundColor = [UIColorFromRGB(MainText0Color) colorWithAlphaComponent:0.5];
    self.s_centerView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 335)/2, (kSCREEN_HEIGHT - 394)/2 - 20, 335, 394)];
    self.s_centerView.image = FTImage(@"Center_AccountCancellation_Image");
    [self.s_centerView setUserInteractionEnabled:YES];
    [self.view addSubview:self.s_centerView];
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 31, self.s_centerView.width, 25)];
    titLabel.text = @"Account cancellation";
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.font = FTMediumFont(18);
    titLabel.textColor = UIColorFromRGB(MainText3Color);
    [self.s_centerView addSubview:titLabel];
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 70, self.s_centerView.width - 80, 195)];
    descLabel.text = @"The account could not be restored after cancellation. To ensure the security of your account please confirm that you have handled the account-related service correctly before applying and registering";
    descLabel.textAlignment = NSTextAlignmentCenter;
    descLabel.font = FTRegularFont(16);
    descLabel.numberOfLines = 0;
    descLabel.textColor = UIColorFromRGB(MainText3Color);
    [self.s_centerView addSubview:descLabel];
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 260, self.s_centerView.width, 22)];
    tipLabel.text = @"All loans have been repaid";
    tipLabel.textColor = UIColorFromRGB(0xFF3D3D);
    tipLabel.font = FTRegularFont(16);
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.s_centerView addSubview:tipLabel];
    
    self.s_tipBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, tipLabel.bottom + 17, self.s_centerView.width, 20)];
    [self.s_tipBtn setImage:FTImage(@"login_select_nomarl_Image") forState:UIControlStateNormal];
    [self.s_tipBtn setImage:FTImage(@"login_select_selected_Image") forState:UIControlStateSelected];
    [self.s_tipBtn setTitle:@" I have read and agreed to the above" forState:UIControlStateNormal];
    [self.s_tipBtn setTitleColor:UIColorFromRGB(MainText3Color) forState:UIControlStateNormal];
    [self.s_tipBtn.titleLabel setFont:FTRegularFont(14)];
    [self.s_tipBtn addTapAction:^(UIGestureRecognizer *sender) {
        STRONG_SELF
        self.s_tipBtn.selected = YES;
    }];
    [self.s_centerView addSubview:self.s_tipBtn];
    
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
    [confirmBtn addTarget:self action:@selector(snowsconsidine) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(247);
        make.height.mas_equalTo(54);
        make.top.equalTo(self.s_centerView.mas_bottom).offset(15);
        make.centerX.equalTo(self.s_centerView);
    }];
    
}

- (void)snowsconsidine
{
    if (!self.s_tipBtn.selected) {
        return;
    }
    [SVProgressHUD show];
    [FTNetting getWithURLServiceString:snowsconsidine parameters:nil success:^(FTResponseModel *model) {
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
