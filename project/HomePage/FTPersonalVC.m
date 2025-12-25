//
//  FTPersonalVC.m
//  project
//
//  Created by 周群 on 2024/8/4.
//

#import "FTPersonalVC.h"
#import "FTExtSelectVC.h"
#import "FTSelectCityVC.h"

@interface FTPersonalVC ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView   *s_scrollView;
@property (nonatomic, strong)NSMutableArray *s_textfieldArr;
@property (nonatomic, strong)NSMutableArray *s_valueArr;
@property (nonatomic, strong)NSArray        *s_arr;
@property (nonatomic, strong)NSString       *s_startTimeStr;

@end

@implementation FTPersonalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNaviBarWithTitle:self.m_titStr LeftImage:FTImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    if (self.m_isPersonBool) {
        [self snowstoussaint];
    }else{
        [self snowshenley];
    }
    self.s_startTimeStr = [FTCommonObject getTimeStampString];

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    for (UITextField *textField in self.s_textfieldArr) {
        [textField resignFirstResponder];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [SVProgressHUD dismiss];
}

- (void)snowshenley
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_productIdStr forKey:@"velaryon"];
    [SVProgressHUD show];
    WEAK_SELF
    [FTNetting postWithURLServiceString:snowshenley parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            [SVProgressHUD dismiss];
            NSDictionary *dic = (NSDictionary *)model.data;
            NSArray *arr = [dic arrayForKey:@"aegon"];
            [self addSubViewsWithArr:arr];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)snowstoussaint
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_productIdStr forKey:@"velaryon"];
    [SVProgressHUD show];
    WEAK_SELF
    [FTNetting postWithURLServiceString:snowstoussaint parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            [SVProgressHUD dismiss];
            NSDictionary *dic = (NSDictionary *)model.data;
            NSArray *arr = [dic arrayForKey:@"aegon"];
            [self addSubViewsWithArr:arr];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)addSubViewsWithArr:(NSArray *)arr
{
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(35, kSCREEN_HEIGHT - XBottomHeight - 15 - 51, kSCREEN_WIDTH - 70, 51)];
    [nextBtn setBackgroundColor:UIColorFromRGB(0x49C9A5) forState:UIControlStateNormal];
    [nextBtn roundedRect:20];
    [nextBtn setTitle:@"Next" forState:UIControlStateNormal];
    [nextBtn.titleLabel setFont:FTBoldFont(20)];
    [nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    self.s_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavBarHeight, kSCREEN_WIDTH, nextBtn.top - 15 - NavBarHeight)];
    self.s_scrollView.backgroundColor = [UIColor clearColor];
    self.s_scrollView.delegate = self;
    self.s_scrollView.showsVerticalScrollIndicator = NO;
    self.s_scrollView.showsHorizontalScrollIndicator = NO;
    self.s_scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.s_scrollView];
    
    self.s_textfieldArr = [NSMutableArray array];
    self.s_valueArr = [NSMutableArray array];
    self.s_arr = arr;
    for (int k = 0 ; k < arr.count; k++) {
        [self.s_valueArr safe_addObject:@""];
        NSDictionary *dic = [arr safe_objectAtIndex:k];
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15 + 92*k, kSCREEN_WIDTH - 30, 24)];
        titLabel.text = [dic stringForKey:@"ackie"];
        titLabel.textColor = UIColorFromRGB(MainText3Color);
        titLabel.font = FTMediumFont(16);
        [self.s_scrollView addSubview:titLabel];
        
        __block UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(15, titLabel.bottom + 8, kSCREEN_WIDTH - 30, 48)];
        [textfield roundedRect:10 borderWidth:1 borderColor:UIColorFromRGB(0x0BB0A6)];
        textfield.tag = k;
        if ([dic integerForKey:@"rebellion"] == 1) {
            textfield.keyboardType = UIKeyboardTypeNumberPad;
        }
        textfield.textColor = UIColorFromRGB(MainText3Color);
        textfield.font = FTRegularFont(16);
        textfield.backgroundColor = [UIColor clearColor];
        NSAttributedString *accountAttrString = [[NSAttributedString alloc] initWithString:[dic stringForKey:@"confirmed"] attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xcccccc),NSFontAttributeName:FTRegularFont(16)}];
        textfield.attributedPlaceholder = accountAttrString;
        [self.s_scrollView addSubview:textfield];
        [self.s_textfieldArr safe_addObject:textfield];
        textfield.text = [dic stringForKey:@"adult"];
        if (textfield.text.hasTextContent) {
            NSMutableDictionary *valueDic = [NSMutableDictionary dictionary];
            [valueDic safe_setObject:[dic stringForKey:@"cooke"] forKey:@"cooke"];
            [valueDic safe_setObject:[dic stringForKey:@"adult"] forKey:@"projects"];
            [self.s_valueArr replaceObjectAtIndex:k withObject:valueDic];
        }
        
        WEAK_SELF
        [textfield addTapAction:^(UIGestureRecognizer *sender) {
            STRONG_SELF
            __block UITextField *selectTextfield = (UITextField *)[sender view];
            [selectTextfield becomeFirstResponder];
            if ([[dic stringForKey:@"animation"] isEqualToString:@"voyagesa"]) {
                [selectTextfield resignFirstResponder];
                FTExtSelectVC *vc = [FTExtSelectVC new];
                vc.m_titStr = [dic stringForKey:@"ackie"];
                vc.m_typeArr = [dic arrayForKey:@"conquest"];
                WEAK_SELF
                vc.block = ^(NSDictionary * _Nonnull dic) {
                    STRONG_SELF
                    selectTextfield.text = [dic stringForKey:@"projects"];
                    [self.s_valueArr replaceObjectAtIndex:selectTextfield.tag withObject:dic];
                };
                UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
                nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                [self presentViewController:nc animated:NO completion:nil];
            }else if ([[dic stringForKey:@"animation"] isEqualToString:@"voyagesc"]) {
                [selectTextfield resignFirstResponder];
                FTSelectCityVC *vc = [FTSelectCityVC new];
                WEAK_SELF
                vc.block = ^(NSMutableArray * _Nonnull cityArr) {
                    STRONG_SELF
                    NSMutableArray *arr = [NSMutableArray array];
                    for (int k = 0; k < cityArr.count; k++) {
                        NSDictionary *dic = [cityArr safe_objectAtIndex:k];
                        [arr safe_addObject:[dic stringForKey:@"projects"]];
                    }
                    selectTextfield.text = [arr componentsJoinedByString:@"|"];
                    [self.s_valueArr replaceObjectAtIndex:selectTextfield.tag withObject:cityArr];
                };
                UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
                nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                [self presentViewController:nc animated:NO completion:nil];
                
            }
        }];
        
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, textfield.height)];
        textfield.leftView = leftView;
        textfield.leftViewMode = UITextFieldViewModeAlways;
        
        if ([[dic stringForKey:@"animation"] isEqualToString:@"voyagesa"] || [[dic stringForKey:@"animation"] isEqualToString:@"voyagesc"]) {
            UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, textfield.height, textfield.height)];
            UIImageView *rArrowImageView = [[UIImageView alloc]initWithFrame:rightView.bounds];
            rArrowImageView.image = FTImage(@"Detail_contact_arrow_Image");
            rArrowImageView.contentMode = UIViewContentModeCenter;
            [rightView addSubview:rArrowImageView];
            textfield.rightView = rightView;
            textfield.rightViewMode = UITextFieldViewModeAlways;
            
        }
        
        if (k == arr.count - 1) {
            if (textfield.bottom > self.s_scrollView.height) {
                [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, textfield.bottom + 15)];
            }else{
                [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, self.s_scrollView.height + 1)];
            }
        }
    }
}

- (void)nextBtnAction
{
    for (UITextField *textField in self.s_textfieldArr) {
        if (!textField.text.hasTextContent) {
            [SVProgressHUD showInfoWithStatus:textField.placeholder];
            return;
        }
    }
    if (self.m_isPersonBool) {
        [self snowssteve];
    }else{
        [self snowsgeorgie];
    }
}

- (void)snowsgeorgie
{
    [SVProgressHUD show];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_productIdStr forKey:@"velaryon"];
    for (int k = 0; k < self.s_arr.count; k++) {
        NSDictionary *subDic = [self.s_arr safe_objectAtIndex:k];
        if ([[subDic stringForKey:@"animation"] isEqualToString:@"voyagesa"]) {
            NSDictionary *valueDic = [self.s_valueArr safe_objectAtIndex:k];
            [dic safe_setObject:[valueDic stringForKey:@"cooke"] forKey:[subDic stringForKey:@"attached"]];
        }else{
            UITextField *textField = [self.s_textfieldArr safe_objectAtIndex:k];
            [dic safe_setObject:textField.text forKey:[subDic stringForKey:@"attached"]];
        }
    }
    WEAK_SELF
    [FTNetting postWithURLServiceString:snowsgeorgie parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            [SVProgressHUD showSuccessWithStatus:model.msg];
            [FTCommonObject postDataWithStartTime:self.s_startTimeStr endTime:[FTCommonObject getTimeStampString] type:@"6" order:nil];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)snowssteve
{
    [SVProgressHUD show];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_productIdStr forKey:@"velaryon"];
    for (int k = 0; k < self.s_arr.count; k++) {
        NSDictionary *subDic = [self.s_arr safe_objectAtIndex:k];
        if ([[subDic stringForKey:@"animation"] isEqualToString:@"voyagesa"]) {
            NSDictionary *valueDic = [self.s_valueArr safe_objectAtIndex:k];
            [dic safe_setObject:[valueDic stringForKey:@"cooke"] forKey:[subDic stringForKey:@"attached"]];
        }else{
            UITextField *textField = [self.s_textfieldArr safe_objectAtIndex:k];
            [dic safe_setObject:textField.text forKey:[subDic stringForKey:@"attached"]];
        }
    }
    WEAK_SELF
    [FTNetting postWithURLServiceString:snowssteve parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            [SVProgressHUD showSuccessWithStatus:model.msg];
            [self.navigationController popViewControllerAnimated:YES];
            [FTCommonObject postDataWithStartTime:self.s_startTimeStr endTime:[FTCommonObject getTimeStampString] type:@"5" order:nil];
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
