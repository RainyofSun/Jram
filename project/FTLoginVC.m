//
//  FTLoginVC.m
//  project
//
//  Created by 周群 on 2024/7/30.
//

#import "FTLoginVC.h"
#import <YYText/YYText.h>
#import "FTWebViewVC.h"
#import "MainTabViewController.h"

static int timeValue = 60;

@interface FTLoginVC ()
@property (nonatomic, strong)UIButton    *s_agreeBtn;
@property (nonatomic, strong)UITextField *s_accountTextfield;
@property (nonatomic, strong)UITextField *s_codeTextfield;
@property (nonatomic, strong)UIButton    *s_getCodeButton;
@property (nonatomic, strong)NSTimer     *s_timer;
@property (nonatomic, strong)NSString    *s_startTimeStr;
@property (nonatomic, assign)BOOL         s_isFirstBool;

@end

@implementation FTLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
    [self initNaviBarWithTitle:nil LeftImage:FTImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    self.huNavigationBar.backgroundColor = [UIColor clearColor];
}

- (void)showLocationAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location Permission Required"
                                                                             message:@"This app requires location access to function properly. Please enable location services in Settings."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Go to Settings"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
        // 打开应用的设置页面
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alertController addAction:settingsAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)leftAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addSubViews
{
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.image = FTImage(@"login_back_Image");
    [self.view addSubview:backImageView];
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, kSCREEN_HEIGHT - XBottomHeight - 60 - 54, kSCREEN_WIDTH - 100, 54)];
    [loginBtn setBackgroundImage:FTImage(@"login_btn_back_Image") forState:UIControlStateNormal];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [loginBtn.titleLabel setFont:FTBoldFont(16)];
    [loginBtn addTarget:self action:@selector(aboutlawrenceseptember) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    self.s_agreeBtn = [[UIButton alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 310)/2, loginBtn.top - 34, 20, 20)];
    [self.s_agreeBtn setImage:FTImage(@"login_select_nomarl_Image") forState:UIControlStateNormal];
    [self.s_agreeBtn setImage:FTImage(@"login_select_selected_Image") forState:UIControlStateSelected];
    [self.s_agreeBtn addTarget:self action:@selector(agreeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.s_agreeBtn.touchAreaInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    self.s_agreeBtn.selected = YES;
    [self.view addSubview:self.s_agreeBtn];
    
    WEAK_SELF
    NSString *agreementText = @"I have read and agree Loan Agreement";
    NSMutableAttributedString *text  = [[NSMutableAttributedString alloc] initWithString:agreementText];
    text.yy_color = UIColorFromRGB(MainText9Color);
    text.yy_font = FTRegularFont(14);
    text.yy_alignment = NSTextAlignmentCenter;
    [text yy_setFont:FTMediumFont(14) range:[agreementText rangeOfString:@"Loan Agreement"]];
    [text yy_setUnderlineStyle:NSUnderlineStyleSingle range:[agreementText rangeOfString:@"Loan Agreement"]];
    [text yy_setTextHighlightRange:[agreementText rangeOfString:@"Loan Agreement"] color:UIColorFromRGB(0x006D54) backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        STRONG_SELF
        FTWebViewVC *webVC = [FTWebViewVC new];
        webVC.m_titleStr = @"Loan Agreement";
        webVC.m_urlStr = @"https://corpfundlending.com/MPera-PrivacyPolicy.html";
        [self.navigationController pushViewController:webVC animated:YES];
    }];
    
    YYLabel *infoLabel = [[YYLabel alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 300)/2, self.s_agreeBtn.top, 300, self.s_agreeBtn.height)];
    infoLabel.numberOfLines = 0;
    infoLabel.attributedText = text;
    [self.view addSubview:infoLabel];
    [infoLabel sizeToFit];
    [infoLabel setFrame:CGRectMake((kSCREEN_WIDTH - infoLabel.width)/2 + 10, infoLabel.top, infoLabel.width, infoLabel.height)];
    self.s_agreeBtn.left = infoLabel.left - 20;
    self.s_agreeBtn.top = infoLabel.top;
    self.s_agreeBtn.width = 20;
        
    self.s_codeTextfield = [[UITextField alloc]initWithFrame:CGRectMake(32, kSCREEN_HEIGHT/2 + 40, kSCREEN_WIDTH - 64, 50)];
    self.s_codeTextfield.font = FTRegularFont(14);
    self.s_codeTextfield.keyboardType = UIKeyboardTypeNumberPad;
    self.s_codeTextfield.textColor = UIColorFromRGB(MainText3Color);
    self.s_codeTextfield.backgroundColor = UIColorFromRGB(MainWhiteColor);
    [self.s_codeTextfield roundedRect:6];
    NSAttributedString *passwordAttrString = [[NSAttributedString alloc] initWithString:@"Verification code" attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xd9d9d9),NSFontAttributeName:FTRegularFont(14)}];
    self.s_codeTextfield.attributedPlaceholder = passwordAttrString;
    [self.view addSubview:self.s_codeTextfield];
    
    UIView *codeLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, self.s_accountTextfield.height)];
    [codeLeftView setBackgroundColor:[UIColor clearColor]];
    self.s_codeTextfield.leftView = codeLeftView;
    self.s_codeTextfield.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *codeRighrView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 84, self.s_codeTextfield.height)];
    [codeRighrView setBackgroundColor:[UIColor clearColor]];
    _s_getCodeButton = [[UIButton alloc]initWithFrame:codeRighrView.bounds];
    [_s_getCodeButton.titleLabel setFont:FTMediumFont(14)];
    [_s_getCodeButton setTitle:@"Get code" forState:UIControlStateNormal];
    [_s_getCodeButton setTitleColor:UIColorFromRGB(MainGreenColor) forState:UIControlStateNormal];
    [_s_getCodeButton addTarget:self action:@selector(aboutdeception) forControlEvents:UIControlEventTouchUpInside];
    [codeRighrView addSubview:_s_getCodeButton];
    self.s_codeTextfield.rightView = codeRighrView;
    self.s_codeTextfield.rightViewMode = UITextFieldViewModeAlways;
    
    UIButton *soundBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.s_codeTextfield.left, self.s_codeTextfield.bottom , self.s_codeTextfield.width, 58)];
    [soundBtn setImage:FTImage(@"login_voice_Image") forState:UIControlStateNormal];
    [soundBtn setTitle:@" VOZ?" forState:UIControlStateNormal];
    [soundBtn.titleLabel setFont:FTMediumFont(12)];
    [soundBtn setTitleColor:UIColorFromRGB(MainGreenColor) forState:UIControlStateNormal];
    [soundBtn addTarget:self action:@selector(aboutinterim) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:soundBtn];
    
    UILabel *codeTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.s_codeTextfield.left, self.s_codeTextfield.top - 37, self.s_codeTextfield.width, 25)];
    codeTitLabel.text = @"Verification code";
    codeTitLabel.textColor = UIColorFromRGB(MainText3Color);
    codeTitLabel.font = FTMediumFont(18);
    [self.view addSubview:codeTitLabel];
    
    self.s_accountTextfield = [[UITextField alloc]initWithFrame:CGRectMake(self.s_codeTextfield.left, codeTitLabel.top - 50 - 22, kSCREEN_WIDTH - 64, 50)];
    [self.s_accountTextfield roundedRect:6];
    self.s_accountTextfield.backgroundColor = UIColorFromRGB(MainWhiteColor);
    NSAttributedString *accountAttrString = [[NSAttributedString alloc] initWithString:@"Enter your phone number" attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xd9d9d9),NSFontAttributeName:FTRegularFont(14)}];
    self.s_accountTextfield.attributedPlaceholder = accountAttrString;
    self.s_accountTextfield.textColor = UIColorFromRGB(MainText3Color);
    self.s_accountTextfield.font = FTRegularFont(14);
    self.s_accountTextfield.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.s_accountTextfield];
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, self.s_accountTextfield.height)];
    [leftView setBackgroundColor:[UIColor clearColor]];
    self.s_accountTextfield.leftView = leftView;
    self.s_accountTextfield.leftViewMode = UITextFieldViewModeAlways;
    
    UILabel *accountTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.s_accountTextfield.left, self.s_accountTextfield.top - 37, self.s_accountTextfield.width, 25)];
    accountTitLabel.text = @"Phone number";
    accountTitLabel.textColor = UIColorFromRGB(MainText3Color);
    accountTitLabel.font = FTMediumFont(18);
    [self.view addSubview:accountTitLabel];
    
    UILabel *topTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, accountTitLabel.top - 40 - 22, kSCREEN_WIDTH, 22)];
    topTitLabel.text = @"Welcome to Kaya Tunai";
    topTitLabel.textColor = UIColorFromRGB(0x2A3E40);
    topTitLabel.font = FTRegularFont(16);
    topTitLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:topTitLabel];
    
    UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 107)/2, topTitLabel.top - 11 - 93, 107, 93)];
    topImageView.image = FTImage(@"login_logo_Image");
    [self.view addSubview:topImageView];
    
}

- (void)aboutdeception
{
    [self.s_accountTextfield resignFirstResponder];
    [self.s_codeTextfield resignFirstResponder];
    if (!self.s_accountTextfield.text.hasTextContent) {
        return;
    }
    if (!self.s_isFirstBool) {
        self.s_isFirstBool = YES;
        self.s_startTimeStr = [FTCommonObject getTimeStampString];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.s_accountTextfield.text.trimAllSpace forKey:@"shadows"];
    [SVProgressHUD show];
    WEAK_SELF
    [FTNetting postWithURLServiceString:aboutdeception parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            [SVProgressHUD showSuccessWithStatus:model.msg];
            timeValue = 60;
            self.s_timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dealYzmBut) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:self.s_timer forMode:NSRunLoopCommonModes];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)aboutinterim
{
    [self.s_accountTextfield resignFirstResponder];
    [self.s_codeTextfield resignFirstResponder];
    if (!self.s_accountTextfield.text.hasTextContent) {
        return;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.s_accountTextfield.text.trimAllSpace forKey:@"shadows"];
    [SVProgressHUD show];
    [FTNetting postWithURLServiceString:aboutinterim parameters:dic success:^(FTResponseModel *model) {
        [SVProgressHUD dismiss];
        if (model.success) {
            [SVProgressHUD showSuccessWithStatus:model.msg];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)dealYzmBut{
    if (timeValue == 0) {
        [_s_getCodeButton setTitle:@"Get code" forState:UIControlStateNormal];
        _s_getCodeButton.userInteractionEnabled = YES;
        timeValue = 60;
        [_s_timer invalidate];
        _s_timer = nil;
        return;
    }
    _s_getCodeButton.userInteractionEnabled = NO;
    [_s_getCodeButton setTitle:[NSString stringWithFormat:@"%d S",timeValue] forState:UIControlStateNormal];
    timeValue--;
}

- (void)agreeBtnAction:(UIButton *)btn
{
    btn.selected = !btn.selected;
    
}

- (void)aboutlawrenceseptember
{
    [self.s_accountTextfield resignFirstResponder];
    [self.s_codeTextfield resignFirstResponder];
    if (!self.s_agreeBtn.selected) {
        [SVProgressHUD showInfoWithStatus:self.s_agreeBtn.currentTitle];
        return;
    }
    
    if (!self.s_accountTextfield.text.hasTextContent) {
        [SVProgressHUD showInfoWithStatus:@"Please enter your phone number"];
        return;
    }
    
    if (!self.s_codeTextfield.text.hasTextContent) {
        [SVProgressHUD showInfoWithStatus:@"Please enter the verification code"];
        return;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.s_accountTextfield.text.trimAllSpace forKey:@"lawrencefebruary"];
    [dic safe_setObject:self.s_codeTextfield.text.trimAllSpace forKey:@"censorship"];
    [SVProgressHUD show];
    WEAK_SELF
    [FTNetting postWithURLServiceString:aboutlawrenceseptember parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        [SVProgressHUD dismiss];
        if (model.success) {
            NSDictionary *dic = (NSDictionary *)model.data;
            [FT_Defaults safe_SetObject:[dic stringForKey:@"intend"] forKey:MainToken];
            [FT_Defaults safe_SetObject:[dic stringForKey:@"lawrencefebruary"] forKey:MainPhone];
            [FTCommonObject postDataWithStartTime:self.s_startTimeStr endTime:[FTCommonObject getTimeStampString] type:@"1" order:nil];
            [self dismissViewControllerAnimated:YES completion:^{
                if (self.block) {
                    self.block();
                }
            }];
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
