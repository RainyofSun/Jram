//
//  ChanPinViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/26.
//

#import "ChanPinViewController.h"
#import "CardPublicViewController.h"
#import "PersonalinfoViewController.h"
#import "UserExitViewController.h"
@interface ChanPinViewController ()

@property (nonatomic, strong)UIScrollView   *s_scrollView;
@property (nonatomic, strong)UIButton       *s_agreeBtn;
@property (nonatomic, strong)NSDictionary   *s_speakingDic;
@property (nonatomic, strong)NSDictionary   *s_dic;

@end

@implementation ChanPinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNaviBarWithTitle:@"MabilisPera" LeOSLWImage:OSLWImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    self.s_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavBarHeight, kSCREEN_WIDTH, kSCREEN_HEIGHT - NavBarHeight)];
    self.s_scrollView.backgroundColor = [UIColor whiteColor];
    self.s_scrollView.showsVerticalScrollIndicator = NO;
    self.s_scrollView.showsHorizontalScrollIndicator = NO;
    self.s_scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.s_scrollView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self snowsmizuno];
}

- (void)snowsmizuno
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_productIdStr forKey:@"velaryon"];
    [SVProgressHUD show];
    WEAK_SELF
    [BaseNetRequest postWithURLServiceString:snowsmizuno parameters:dic success:^(BaseResponseModel *model) {
        STRONG_SELF
        if ((model.success)) {
            NSDictionary *dic = (NSDictionary *)model.data;
            [SVProgressHUD dismiss];
            [self addSubViewsWithDic:dic];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)addSubViewsWithDic:(NSDictionary *)dic
{
    self.s_speakingDic = [dic dictionaryForKey:@"speaking"];
    NSDictionary *subDic = [dic dictionaryForKey:@"bruno"];
    self.s_dic = subDic;
    [self.s_scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 343)/2, 20, 343, 247)];
    topImageView.image = OSLWImage(@"HomePage_detail_Image");
    [self.s_scrollView addSubview:topImageView];
    
    UIImageView *productIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(28, 7, 36, 36)];
    [productIconImageView roundedRect:10 borderWidth:1 borderColor:UIColorFromRGB(MainWhiteColor)];
    [topImageView addSubview:productIconImageView];
    
    UILabel *productTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(productIconImageView.right + 10, productIconImageView.top, 200, productIconImageView.height)];
    productTitLabel.textColor = UIColorFromRGB(MainWhiteColor);
    productTitLabel.font = OSLWBoldFont(14);
    [topImageView addSubview:productTitLabel];
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, topImageView.width, 20)];
    titLabel.text = @"Maximum loan amount";
    titLabel.textColor = UIColorFromRGB(MainText3Color);
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.font = OSLWMediumFont(14);
    [topImageView addSubview:titLabel];
    
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, titLabel.bottom + 10, titLabel.width, 44)];
    priceLabel.textColor = UIColorFromRGB(0x006D54);
    priceLabel.textAlignment = NSTextAlignmentCenter;
    priceLabel.font = OSLWBoldFont(36);
    [topImageView addSubview:priceLabel];
    
    UIImageView *jiantouImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, priceLabel.bottom + 15, topImageView.width - 60, 12)];
    jiantouImageView.image = OSLWImage(@"HomePage_top_jiantou_Image");
    [topImageView addSubview:jiantouImageView];
    
    UIImageView *leOSLWImageView = [[UIImageView alloc]initWithFrame:CGRectMake(27, jiantouImageView.bottom + 18, 130, 46)];
    leOSLWImageView.image = OSLWImage(@"HomePage_top_product_Image");
    [topImageView addSubview:leOSLWImageView];
    
    UIImageView *leftIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 26, 26)];
    leftIconImageView.image = OSLWImage(@"HomePage_top_left_Image");
    [leOSLWImageView addSubview:leftIconImageView];
    
    UILabel *leftValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(leOSLWImageView.width - 110, 6, 100, 16)];
    leftValueLabel.textColor = UIColorFromRGB(MainText3Color);
    leftValueLabel.font = OSLWMediumFont(12);
    leftValueLabel.textAlignment = NSTextAlignmentRight;
    [leOSLWImageView addSubview:leftValueLabel];
    
    UILabel *leftTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(leOSLWImageView.width - 110, leftValueLabel.bottom + 4, 100, 12)];
    leftTitLabel.textColor = UIColorFromRGB(MainText3Color);
    leftTitLabel.font = OSLWRegularFont(11);
    leftTitLabel.text = @"Loan Time";
    leftTitLabel.textAlignment = NSTextAlignmentRight;
    [leOSLWImageView addSubview:leftTitLabel];
    
    UIImageView *rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(leOSLWImageView.right + 29, jiantouImageView.bottom + 18, 130, 46)];
    rightImageView.image = OSLWImage(@"HomePage_top_product_Image");
    [topImageView addSubview:rightImageView];
    
    UIImageView *rightIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 26, 26)];
    rightIconImageView.image = OSLWImage(@"HomePage_top_right_Image");
    [rightImageView addSubview:rightIconImageView];
    
    UILabel *rightValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(leOSLWImageView.width - 110, 6, 100, 16)];
    rightValueLabel.textColor = UIColorFromRGB(MainText3Color);
    rightValueLabel.font = OSLWMediumFont(12);
    rightValueLabel.textAlignment = NSTextAlignmentRight;
    [rightImageView addSubview:rightValueLabel];
    
    UILabel *rightTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(leOSLWImageView.width - 110, leftValueLabel.bottom + 4, 100, 12)];
    rightTitLabel.textColor = UIColorFromRGB(MainText3Color);
    rightTitLabel.font = OSLWRegularFont(11);
    rightTitLabel.text = @"Interest Term";
    rightTitLabel.textAlignment = NSTextAlignmentRight;
    [rightImageView addSubview:rightTitLabel];
    
    [productIconImageView sd_setImageWithURL:[NSURL URLWithString:[subDic stringForKey:@"latter"]] placeholderImage:OSLWImage(@"logoImage")];
    productTitLabel.text = [subDic stringForKey:@"begun"];
    priceLabel.text = [subDic stringForKey:@"aka"];
    NSDictionary *referenceDic = [subDic dictionaryForKey:@"reference"];
    NSDictionary *segalDic = [referenceDic dictionaryForKey:@"segal"];
    NSDictionary *shipsDic = [referenceDic dictionaryForKey:@"ships"];
    
    leftValueLabel.text = [segalDic stringForKey:@"amanda"];
    leftTitLabel.text = [segalDic stringForKey:@"ackie"];
    rightValueLabel.text = [shipsDic stringForKey:@"amanda"];
    rightTitLabel.text = [shipsDic stringForKey:@"ackie"];
    
    NSArray *movingArr = [dic arrayForKey:@"moving"];
    
    CGFloat x = topImageView.left;
    CGFloat y = topImageView.bottom + 15;
    for (int k = 0; k < movingArr.count; k++) {
        NSDictionary *sssubDic = [movingArr safe_objectAtIndex:k];
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(x, y, (topImageView.width - 13)/2, 133)];
        backView.backgroundColor = [UIColor clearColor];
        [self.s_scrollView addSubview:backView];
        [backView addTapAction:^(UIGestureRecognizer *sender) {
            if ([[sssubDic stringForKey:@"stage"] isEqualToString:@"baseda"] && [[sssubDic stringForKey:@"closer"] isEqualToString:@"1"]) {
                CardPublicViewController *vc = [CardPublicViewController new];
                vc.m_productIdStr = self.m_productIdStr;
                [self.navigationController pushViewController:vc animated:YES];
            }else if (([[sssubDic stringForKey:@"stage"] isEqualToString:@"basedb"] || [[sssubDic stringForKey:@"stage"] isEqualToString:@"basedc"]) && [[sssubDic stringForKey:@"closer"] isEqualToString:@"1"]){
                PersonalinfoViewController *vc = [PersonalinfoViewController new];
                vc.m_productIdStr = self.m_productIdStr;
                vc.m_titStr = [sssubDic stringForKey:@"ackie"];
                vc.m_isPersonBool = [[sssubDic stringForKey:@"stage"] isEqualToString:@"basedb"];
                [self.navigationController pushViewController:vc animated:YES];
            }else if ([[sssubDic stringForKey:@"stage"] isEqualToString:@"basedd"] && [[sssubDic stringForKey:@"closer"] isEqualToString:@"1"]){
                UserExitViewController *vc = [UserExitViewController new];
                vc.m_productIdStr = self.m_productIdStr;
                [self.navigationController pushViewController:vc animated:YES];
            }else if ([[sssubDic stringForKey:@"stage"] isEqualToString:@"basede"] && [[sssubDic stringForKey:@"closer"] isEqualToString:@"1"]){
                if ([sssubDic stringForKey:@"castings"].hasTextContent) {
                    WebViewViewController *vc = [WebViewViewController new];
                    vc.m_titleStr = [sssubDic stringForKey:@"ackie"];
                    vc.m_urlStr = [sssubDic stringForKey:@"castings"];
                    [self.navigationController pushViewController:vc animated:YES];
                }
            }else{
                [self nextBtnAction];
            }
        }];
        x = backView.right + 13;
        if (x + 20 > topImageView.width) {
            x = topImageView.left;
            y = backView.bottom;
        }
        
        UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, backView.width, 100)];
        blueView.backgroundColor = UIColorFromRGB(0xE2FDF1);
        [blueView roundedRect:12];
        [backView addSubview:blueView];
        
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 34, blueView.width, 24)];
        titLabel.text = [sssubDic stringForKey:@"ackie"];
        titLabel.textAlignment = NSTextAlignmentCenter;
        titLabel.font = OSLWRegularFont(16);
        titLabel.textColor = UIColorFromRGB(MainText3Color);
        [blueView addSubview:titLabel];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, titLabel.bottom + 5, blueView.width, 22)];
        [btn setTitle:@"Go upload" forState:UIControlStateNormal];
        [btn setUserInteractionEnabled:NO];
        [btn setTitleColor:UIColorFromRGB(0x15A77E) forState:UIControlStateNormal];
        if ([[sssubDic stringForKey:@"closer"] isEqualToString:@"1"]) {
            [btn.titleLabel setFont:OSLWMediumFont(16)];
            [btn setImage:OSLWImage(@"Detail_complete_Image") forState:UIControlStateNormal];
        }else{
            [btn.titleLabel setFont:OSLWRegularFont(16)];
            [btn setImage:OSLWImage(@"Detail_no_complete_Image") forState:UIControlStateNormal];
        }
        
        [btn setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        [blueView addSubview:btn];
        
        UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake((backView.width - 41)/2, 0, 41, 41)];
        iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        [iconImageView roundedRect:12];
        NSString *imageStr = [NSString stringWithFormat:@"Detail_icon_Image%d",k];
        [iconImageView sd_setImageWithURL:[NSURL URLWithString:[sssubDic stringForKey:@"georgie"]] placeholderImage:OSLWImage(imageStr)];
        [backView addSubview:iconImageView];
        
        if (k == movingArr.count - 1) {
            y = backView.bottom;
        }
    }
    
    NSDictionary *directDic = [dic dictionaryForKey:@"direct"];
    NSString *ackieStr = [directDic stringForKey:@"ackie"];
    if (ackieStr.hasTextContent) {
        CGFloat width = [ackieStr widthWithFont:OSLWMediumFont(12) constrainedToHeight:20];
        self.s_agreeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, y + 10, kSCREEN_WIDTH, 20)];
        [self.s_agreeBtn setImage:OSLWImage(@"login_select_nomarl_Image") forState:UIControlStateNormal];
        [self.s_agreeBtn setImage:OSLWImage(@"login_select_selected_Image") forState:UIControlStateSelected];
        [self.s_agreeBtn addTarget:self action:@selector(agreeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        self.s_agreeBtn.touchAreaInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        [self.s_agreeBtn setTitleColor:UIColorFromRGB(0x006D54) forState:UIControlStateNormal];
        [self.s_agreeBtn.titleLabel setFont:OSLWRegularFont(12)];
        [self.s_agreeBtn setTitle:[NSString stringWithFormat:@" %@",ackieStr] forState:UIControlStateNormal];
        self.s_agreeBtn.selected = YES;
        [self.s_agreeBtn sizeToFit];
        [self.s_agreeBtn setFrame:CGRectMake((kSCREEN_WIDTH - self.s_agreeBtn.width)/2,self.s_agreeBtn.top -10, self.s_agreeBtn.width, 40)];
        [self.s_scrollView addSubview:self.s_agreeBtn];
        WEAK_SELF
        [self.s_agreeBtn addTapAction:^(UIGestureRecognizer *sender) {
            STRONG_SELF
            WebViewViewController *webVC = [WebViewViewController new];
            webVC.m_titleStr = @"Loan Agreement";
            webVC.m_urlStr = [directDic stringForKey:@"overthrow"];
            [self.navigationController pushViewController:webVC animated:YES];
        }];
        
        UIButton *iconBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.s_agreeBtn.height + 10, self.s_agreeBtn.height)];
        [self.s_agreeBtn addSubview:iconBtn];
        [iconBtn addTapAction:^(UIGestureRecognizer *sender) {
                    STRONG_SELF
            self.s_agreeBtn.selected = !self.s_agreeBtn.selected;
        }];
        y = self.s_agreeBtn.bottom;
    }
    
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(35, y + 15, kSCREEN_WIDTH - 70, 51)];
    [nextBtn setBackgroundColor:UIColorFromRGB(0x49C9A5)];
    [nextBtn roundedRect:20];
    [nextBtn setTitle:@"Loan" forState:UIControlStateNormal];
    [nextBtn.titleLabel setFont:OSLWBoldFont(20)];
    [nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.s_scrollView addSubview:nextBtn];
    
    if (nextBtn.bottom + self.s_scrollView.height) {
        [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, nextBtn.bottom + 20 + XBottomHeight)];
    }else{
        [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, self.s_scrollView.height + XBottomHeight)];
    }
    
    
}

- (void)nextBtnAction
{
    if (self.s_agreeBtn.hasContent && !self.s_agreeBtn.selected) {
        [SVProgressHUD showInfoWithStatus:@"Please read the loan agreement carefully first"];
        return;
    }
    if ([[self.s_speakingDic stringForKey:@"stage"] isEqualToString:@"baseda"]) {
        FTPublicVC *vc = [FTPublicVC new];
        vc.m_productIdStr = self.m_productIdStr;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }else if ([[self.s_speakingDic  stringForKey:@"stage"] isEqualToString:@"basedb"] || [[self.s_speakingDic  stringForKey:@"stage"] isEqualToString:@"basedc"]){
        FTPersonalVC *vc = [FTPersonalVC new];
        vc.m_titStr = [self.s_speakingDic stringForKey:@"ackie"];
        vc.m_productIdStr = self.m_productIdStr;
        vc.m_isPersonBool = [[self.s_speakingDic stringForKey:@"stage"] isEqualToString:@"basedb"];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }else if ([[self.s_speakingDic  stringForKey:@"stage"] isEqualToString:@"basedd"]){
        FTExtVC *vc = [FTExtVC new];
        vc.m_productIdStr = self.m_productIdStr;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }else if ([[self.s_speakingDic  stringForKey:@"stage"] isEqualToString:@"basede"]){
        if ([self.s_speakingDic stringForKey:@"castings"].hasTextContent) {
            WebViewViewController *vc = [WebViewViewController new];
            vc.m_bankBool = YES;
            vc.m_urlStr = [self.s_speakingDic stringForKey:@"castings"];
            [self.navigationController pushViewController:vc animated:YES];
            return;
        }
    }
    
    [self snowsdaemon];
    [self snowsemma];
}

- (void)snowsemma
{
    [CommenObject postDataWithStartTime:[CommenObject getTimeStampString] endTime:[CommenObject getTimeStampString] type:@"9" order:[self.s_dic stringForKey:@"queen"]];
}

- (void)snowsdaemon
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [SVProgressHUD show];
    [dic safe_setObject:[self.s_dic stringForKey:@"queen"] forKey:@"ruled"];
    [dic safe_setObject:[self.s_dic stringForKey:@"aka"] forKey:@"aka"];
    [dic safe_setObject:[self.s_dic stringForKey:@"loosely"] forKey:@"loosely"];
    [dic safe_setObject:[self.s_dic stringForKey:@"nation"] forKey:@"nation"];
    [SVProgressHUD show];
    WEAK_SELF
    [BaseNetRequest postWithURLServiceString:snowsdaemon parameters:dic success:^(BaseResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            [SVProgressHUD dismiss];
            NSDictionary *dic = (NSDictionary *)model.data;
            NSString *str = [dic stringForKey:@"castings"];
            [self.navigationController popViewControllerAnimated:NO];
            if (self.block) {
                self.block(str);
            }
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)agreeBtnAction:(UIButton *)btn
{
    btn.selected = !btn.selected;
    
}

@end
