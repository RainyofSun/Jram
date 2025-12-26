//
//  AuthenticationInfoConfirmViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "AuthenticationInfoConfirmViewController.h"
#import "AuthenticationSelectDateViewController.h"

@interface AuthenticationInfoConfirmViewController ()

@property (nonatomic, strong)NSMutableArray *s_textfieldArr;

@end

@implementation AuthenticationInfoConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColorFromRGB(MainText0Color) colorWithAlphaComponent:0.5];
    
    UIImageView *centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 335)/2, (kSCREEN_HEIGHT - 460)/2 - 20, 335, 460)];
    centerImageView.image = OSLWImage(@"Detail_confirm_Image");
    [centerImageView setUserInteractionEnabled:YES];
    [self.view addSubview:centerImageView];
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, centerImageView.width, 25)];
    titLabel.text = @"Please confirm";
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.font = OSLWBoldFont(18);
    titLabel.textColor = UIColorFromRGB(MainText3Color);
    [centerImageView addSubview:titLabel];
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(36, centerImageView.height - 34 - 75, 263, 34)];
    tipLabel.text = @"*Please check your lD information correctly, oncesubmitted it is not changed again";
    tipLabel.font = OSLWRegularFont(12);
    tipLabel.textColor = UIColorFromRGB(0xF14343);
    tipLabel.numberOfLines = 0;
    [centerImageView addSubview:tipLabel];
    
    self.s_textfieldArr = [NSMutableArray array];
    NSArray *titArr = [NSArray arrayWithObjects:@"Name",@"ID No.",@"Date Birth", nil];
    for (int k = 0; k < titArr.count; k++) {
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(54, 92 + 84*k, 200, 24)];
        titLabel.text = [titArr safe_objectAtIndex:k];
        titLabel.textColor = UIColorFromRGB(0x2e2e2e);
        titLabel.font = OSLWRegularFont(16);
        [centerImageView addSubview:titLabel];
        
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(36, titLabel.bottom + 6, centerImageView.width - 2*36, 42)];
        [textfield roundedRect:8];
        textfield.textColor = UIColorFromRGB(MainText3Color);
        textfield.font = OSLWRegularFont(16);
        textfield.backgroundColor = UIColorFromRGB(0xf8f8f8);
        [centerImageView addSubview:textfield];
        [self.s_textfieldArr safe_addObject:textfield];
        
        if (k == 2) {
            [textfield addTapAction:^(UIGestureRecognizer *sender) {
                UITextField *textfield = (UITextField *)[sender view];
                [textfield resignFirstResponder];
                AuthenticationSelectDateViewController *vc = [AuthenticationSelectDateViewController new];
                vc.block = ^(NSString * _Nonnull str) {
                    textfield.text = str;
                };
                UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
                nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                [self presentViewController:nc animated:NO completion:nil];
            }];
        }
        
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, textfield.height)];
        textfield.leftView = leftView;
        textfield.leftViewMode = UITextFieldViewModeAlways;
        
        if (k == 0) {
            textfield.text = [self.m_dic stringForKey:@"projects"];
        }else if (k == 1) {
            textfield.text = [self.m_dic stringForKey:@"involved"];
        }else if (k == 2) {
            textfield.text = [self.m_dic stringForKey:@"develop"];
        }
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
    [confirmBtn addTarget:self action:@selector(snowsrhys) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(247);
        make.height.mas_equalTo(54);
        make.top.equalTo(centerImageView.mas_bottom).offset(15);
        make.centerX.equalTo(centerImageView);
    }];
}

- (void)snowsrhys
{
    BOOL isEmptyBool = NO;
    for (UITextField *textField in self.s_textfieldArr) {
        if (!textField.text.hasTextContent) {
            isEmptyBool = YES;
        }
    }
    if (isEmptyBool) {
        return;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_typeStr forKey:@"offs"];
    [dic safe_setObject:@"11" forKey:@"cooke"];
    for (int k = 0; k < self.s_textfieldArr.count; k++) {
        UITextField *textField = [self.s_textfieldArr safe_objectAtIndex:k];
        if (k == 0) {
            [dic safe_setObject:textField.text forKey:@"projects"];
        }else if (k == 1) {
            [dic safe_setObject:textField.text forKey:@"involved"];
        }else if (k == 2) {
            [dic safe_setObject:textField.text forKey:@"develop"];
        }
    }
    [SVProgressHUD show];
    WEAK_SELF
    [BaseNetRequest postWithURLServiceString:snowsrhys parameters:dic success:^(BaseResponseModel *model) {
        STRONG_SELF
        [SVProgressHUD dismiss];
        if (model.success) {
            [self dismissViewControllerAnimated:NO completion:^{
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

@end
